class AddCourseToEnquiry < ActiveRecord::Migration
  def change
    add_reference :enquiries, :course, index: true, foreign_key: true
  end
end
