class UsersController < ApplicationController
	layout 'admin'

	def index
		@admin_users = Role.find_by(name: 'admin').users
		# @teachers = Role.find_by(name: 'teacher').users
		# @authors = Role.find_by(name: 'author').users
		# @students = Role.find_by(name: 'student').users
		# @club_members = Role.find_by(name: 'club').users
	end
end