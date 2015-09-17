class CreateEnquiryTypes < ActiveRecord::Migration
  def change
    create_table :enquiry_types do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
