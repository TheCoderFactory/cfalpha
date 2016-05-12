admin_user = User.create(email: 'admin@example.com', password: '12345678', first_name: 'Jamie', last_name: 'Cerexhe')
admin_user.add_role :admin


skill_categories = [
	"Web Design",
	"Application Design",
	"User Experience",
	"Databases",
	"Web Application Development"
]
course_types = [
	"Workshop",
	"Part Time",
	"Full Time Intensive",
	"School",
	"Business"
]

courses = [
	{'name' => 'Web Design for Beginners', 'course_type' => 'Workshop', 'icon' => 'chrome', 'active' => 'true'},
	{'name' => 'Wordpress for Beginners', 'course_type' => 'Workshop', 'icon' => 'wordpress', 'active' => 'true'},
	{'name' => 'Coding for Beginners', 'course_type' => 'Workshop', 'icon' => 'terminal', 'active' => 'true'},
	{'name' => 'Coding Kickstarter (FREE)', 'course_type' => 'Workshop', 'icon' => 'play', 'active' => 'true'},
	{'name' => 'Web App Builder', 'course_type' => 'Part Time', 'icon' => 'desktop', 'active' => 'true'},
	{'name' => 'Startup Launcher', 'course_type' => 'Part Time', 'icon' => 'rocket'},
	{'name' => 'Angular Master', 'course_type' => 'Part Time', 'icon' => 'shield'},
	{'name' => 'Digital Leadership', 'course_type' => 'Business', 'icon' => 'bar-chart', 'active' => 'true'},
	{'name' => 'Fast Track', 'course_type' => 'Full Time Intensive', 'icon' => 'train', 'active' => 'true'},
	{'name' => 'Code The Future', 'course_type' => 'School', 'icon' => 'graduation-cap', 'active' => 'true'},
	{'name' => 'Silicon Valley Express', 'course_type' => 'Workshop', 'icon' => 'plane', 'active' => 'true'},
]

course_intakes = [
	{'course' => 'Web Design for Beginners', 'start_date' => '2015-10-10', 'start_time' => '10:00', 'end_date' => '2015-10-11', 'end_time' => '16:00', 'days_of_week' => "Saturday, Sunday", 'price' => 360.0},
	{'course' => 'Coding for Beginners', 'start_date' => '2015-09-19', 'start_time' => '10:00', 'end_date' => '2015-09-20', 'end_time' => '16:00', 'days_of_week' => "Saturday, Sunday", 'price' => 360.0},
	{'course' => 'Wordpress for Beginners', 'start_date' => '2015-09-26', 'start_time' => '10:00', 'end_date' => '2015-09-27', 'end_time' => '16:00', 'days_of_week' => "Saturday, Sunday", 'price' => 360.0},
	{'course' => 'Web App Builder', 'start_date' => '2015-10-20', 'start_time' => '18:00', 'end_date' => '2016-01-23', 'end_time' => '21:00', 'days_of_week' => "Tuesday, Thursday", 'price' => 2400.0},
	{'course' => 'Coding Kickstarter (FREE)', 'start_date' => '2015-09-13', 'start_time' => '14:00', 'end_date' => '2015-09-13', 'end_time' => '16:00', 'days_of_week' => "Sunday", 'price' => 0.0},
	{'course' => 'Coding Kickstarter (FREE)', 'start_date' => '2015-09-27', 'start_time' => '14:00', 'end_date' => '2015-09-27', 'end_time' => '16:00', 'days_of_week' => "Sunday", 'price' => 0.0},
	{'course' => 'Coding Kickstarter (FREE)', 'start_date' => '2015-10-11', 'start_time' => '14:00', 'end_date' => '2015-10-11', 'end_time' => '16:00', 'days_of_week' => "Sunday", 'price' => 0.0},
	{'course' => 'Coding Kickstarter (FREE)', 'start_date' => '2015-10-25', 'start_time' => '14:00', 'end_date' => '2015-10-25', 'end_time' => '16:00', 'days_of_week' => "Sunday", 'price' => 0.0}
]

def create_categories(skill_categories)
  skill_categories.each do |skill_category|
    SkillCategory.create!(name: skill_category, active: true)
  end
end
def create_course_types(course_types)
	course_types.each do |course_type|
		CourseType.create!(name: course_type, active: true)
	end
end

create_categories(skill_categories)
create_course_types(course_types)

CourseLocation.create(name: 'Coder Factory HQ', city: 'Sydney', address_one: 'Level 1', address_two: '7 Hudson Street', suburb: 'Redfern', state: 'NSW', postcode: '2016', country: 'Australia')

def create_courses(courses)
	courses.each do |course|
		course_type_id = CourseType.find_by(name: course['course_type']).id
		Course.create(course_type_id: course_type_id, name: course['name'], icon: course['icon'], active: course['active'])
	end
end

create_courses(courses)

def create_course_intakes(course_intakes)
	course_intakes.each do |intake|
		course_id = Course.find_by(name: intake['course']).id
		# days_of_week = intake['days_of_week'].to_array
		CourseIntake.create(course_id: course_id, course_location_id: 1, start_date: intake['start_date'], start_time: intake['start_time'], end_date: intake['end_date'], end_time: intake['end_time'], days_of_week: intake['days_of_week'], price: intake['price'])
	end
end

create_course_intakes(course_intakes)

EnquiryType.create(name: 'Workshop enquiry', code: 'Workshop')
EnquiryType.create(name: 'Part time enquiry', code: 'Part time')
EnquiryType.create(name: 'Business course enquiry', code: 'Business')
EnquiryType.create(name: 'School enquiry', code: 'School')
EnquiryType.create(name: 'Fast Track enquiry', code: 'Fast Track')
EnquiryType.create(name: 'Partnership enquiry', code: 'Partnership')
EnquiryType.create(name: 'General enquiry', code: 'General')
EnquiryType.create(name: 'Website problem', code: 'Website problem')