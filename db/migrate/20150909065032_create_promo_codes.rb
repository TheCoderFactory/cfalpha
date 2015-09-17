class CreatePromoCodes < ActiveRecord::Migration
  def change
    create_table :promo_codes do |t|
      t.string :name
      t.text :description
      t.decimal :price_value
      t.integer :percent_value
      t.datetime :expiry_date
      t.references :user, index: true, foreign_key: true
      t.string :code
      t.references :course_intake, index: true, foreign_key: true
      t.integer :creator_id
      t.date :date_used

      t.timestamps null: false
    end
  end
end
