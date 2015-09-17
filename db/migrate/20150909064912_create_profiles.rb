class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :picture
      t.string :phone
      t.string :github
      t.string :twitter
      t.string :linkedin
      t.string :gender
      t.string :age
      t.string :referral
      t.string :referral_other

      t.timestamps null: false
    end
  end
end
