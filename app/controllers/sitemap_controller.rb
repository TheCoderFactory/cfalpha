class SitemapController < ApplicationController
	skip_before_action :authenticate_user!
  layout nil

	def index
		@last_new_course = CourseIntake.last
    @courses = Course.active
	  @posts = Post.all
    @static_pages = [
      		  	root_url, 
      		  	blog_url, 
      		  	coder_factory_workshops_for_beginners_url,
      		  	coder_factory_part_time_courses_url,
      		  	coding_workshops_for_businesses_url,
      		  	fast_track_intensive_bootcamp_url,
      		  	fast_track_url,
      		  	coding_for_schools_url,
      		  	community_url,
      		  	about_url,
      		  	contact_url,
      		  	privacy_url
      		 	]
	  headers['Content-Type'] = 'application/xml'
    respond_to do |format|
      format.xml
    end
	end
end
