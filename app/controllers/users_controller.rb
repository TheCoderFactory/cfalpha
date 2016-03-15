class UsersController < ApplicationController
	layout 'admin'
	load_and_authorize_resource
	require 'csv'

	def index
		@role_types = Role.all.order(name: :asc)
		@admin_users = Role.find_by(name: 'admin').users
		#All users used to export users to csv
		@users = User.all
		# @teachers = Role.find_by(name: 'teacher').users
		# @authors = Role.find_by(name: 'author').users
		# @students = Role.find_by(name: 'student').users
		# @club_members = Role.find_by(name: 'club').users
    respond_to do |format|
    	format.html
      format.csv { send_data @users.to_csv, filename: "users-#{Date.today}.csv" }
    end
	end

	def show
		@user = User.find(params[:id])
	end
end