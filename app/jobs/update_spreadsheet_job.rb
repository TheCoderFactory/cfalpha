require "google/api_client"
require "google_drive"


class UpdateSpreadsheetJob
  include SuckerPunch::Job
  include FistOfFury::Recurrent

  recurs{daily.hour_of_day(0, 12)}

  def putInSpreadsheet(item)
    ident = ""
    course = nil
    course_intake = nil
    in_item = item
    case in_item.class.name
    when "Enquiry"
      ident = "CF Enquiry"
    when "Course Booking"
      course_intake = CourseIntake.find(in_item.course_intake_id)
      course = Course.find(course_intake.course_id)
      case course.name
      when "Coding Kickstarter (FREE)"
        ident = "Coding Kickstarter (FREE)"
      when "Coding for Beginners"
        ident = "Coding for Beginners"
      when "Web App Builder"
        ident = "Web App Builder"
      when "Wordpress for Beginners"
        ident = "Wordpress for Beginners"
      when "Teach kids to code - volunteer induction"
        ident = "Teach kids to code (FREE)"
      else
        return false
      end
    else
      return false
    end

    session = GoogleDrive.saved_session("config/config.json")
    ws = session.spreadsheet_by_key("1q1HToULtwI8SoUtArpj1fJR4nMjKB8P8CKIQq4hAMpg").worksheets[0]
    start_row = 2
    index_row = ws.num_rows

    (1..ws.num_rows).each do |row|
      if ws[row, 3] == ident
        start_row = row
        break
      end
    end

    while index_row >= start_row do
      (1..ws.num_cols).each do |col|
        ws[index_row+1, col] = ws[index_row, col]
        ws[index_row, col] = ""
      end
      index_row-=1
    end

    enquiry_type = EnquiryType.find(in_item.enquiry_type_id).name if ident == "CF Enquiry"
    user = User.find(in_item.user_id) if ident != "CF Enquiry"

    ws[start_row, 2] = in_item.created_at.in_time_zone('Sydney').strftime("%m/%d/%y: %H:%M:%S %Z")
    ws[start_row, 3] = ident
    case ident
    when "CF Enquiry"
      ws[start_row, 4] = ""
      ws[start_row, 5] = in_item.first_name
      ws[start_row, 6] = in_item.last_name
      ws[start_row, 7] = in_item.email
      ws[start_row, 8] = in_item.phone
      ws[start_row, 9] = enquiry_type
        ident = "Coding Kickstarter (FREE)"
        ident = "Coding for Beginners"
        ident =  "Web App Builder"
        ident = "Wordpress for Beginners"
        ident = "Teach kids to code (FREE)"
    when "Coding Kickstarter (FREE)" || "Coding for Beginnners" || "Web App Builder" || "Wordpress for Beginners" || "Teach kids to code (FREE)"
      ws[start_row, 4] = course_intake.start_date
      ws[start_row, 5] = user.first_name
      ws[start_row, 6] = user.last_name
      ws[start_row, 7] = user.email
    else
      ws.reload
      ws.save
      return false
    end
    ws.save
    return true
  end

  def perform
    @enquiries = Enquiry.all
    @bookings = CourseBooking.all

    @enquiries.each do |e|
      if !e.in_spreadsheet
        e.update_attribute(:in_spreadsheet, putInSpreadsheet(e))
      end
    end
  end
end
