json.array!(@course_intakes) do |course_intake|
  json.extract! course_intake, :id, :course_id, :course_location_id, :start_date, :start_time, :end_date, :end_time, :days_of_week, :status, :price, :slug
  json.url course_intake_url(course_intake, format: :json)
end
