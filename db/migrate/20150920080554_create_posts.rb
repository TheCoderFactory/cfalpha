class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true, foreign_key: true
      t.references :post_category, index: true, foreign_key: true
      t.string :impressions_count
      t.string :title
      t.text :lead
      t.text :content
      t.string :image
      t.string :slug
      t.boolean :publish
      t.date :published_date

      t.timestamps null: false
    end
  end
end
