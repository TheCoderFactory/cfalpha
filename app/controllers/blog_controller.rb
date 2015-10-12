class BlogController < ApplicationController
	skip_before_action :authenticate_user!
  def index
  	@posts = Post.includes(:user).published_in_reverse_chron_order.paginate(:page => params[:page], :per_page => 5)
  	@intake = CourseIntake.includes(:course, :course_location).upcoming.first
  end
end
