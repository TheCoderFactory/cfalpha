class CreateCourseLocations < ActiveRecord::Migration
  def change
    create_table :course_locations do |t|
      t.string :name
      t.string :city
      t.string :address_one
      t.string :address_two
      t.string :suburb
      t.string :state
      t.string :postcode
      t.string :country
      t.float :latitude
      t.float :longitude
      t.string :slug

      t.timestamps null: false
    end
  end
end
