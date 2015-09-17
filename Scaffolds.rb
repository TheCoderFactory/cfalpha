Scaffolds
rails g migration AddNameToUser first_name last_name
rails g scaffold Profile picture phone github twitter linkedin gender age referral referral_other user:references

rails g scaffold EnquiryType name description:text
rails g scaffold Enquiry enquiry_type:references first_name last_name company phone email message responded_to:boolean user:references

rails g scaffold CourseType name description:text active:boolean slug
rails g scaffold CourseLocation name city address_one address_two suburb state postcode country latitude:float longitude:float slug

rails g scaffold SkillCategory name description:text active:boolean
rails g scaffold Skill skill_category:references name description:text active:boolean

rails g scaffold Course course_type:references name tagline description:text active:boolean slug
rails g model CourseSkill course:references skill:references

rails g scaffold CourseIntake course:references course_location:references start_date:date start_time:time end_date:date end_time:time days_of_week status price slug

rails g scaffold CourseBooking course_intake:references user:references price promo_code paid:boolean completed:boolean 

rails g scaffold PromoCode name description:text price_value:decimal percent_value:integer expiry_date:datetime user:references code course_intake:references creator_id:integer date_used:date

rails g scaffold EventType name description:text slug
rails g scaffold Event event_type:references name description:text date:date start_time:time duration_hours slug location location_link registration_link

rails g scaffold Prequestionnaire course_booking:references reason background experience hobbies
rails g scaffold FeedbackForm course:references course_location:references expectations:integer recommend:integer another:integer satisfaction:integer value:integer best_part:text comments:text testimonial:text
