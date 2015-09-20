class CreateEnquiries < ActiveRecord::Migration
  def change
    create_table :enquiries do |t|
      t.references :enquiry_type, index: true, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :phone
      t.string :email
      t.text :message
      t.boolean :responded_to
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
