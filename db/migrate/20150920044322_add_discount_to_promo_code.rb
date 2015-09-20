class AddDiscountToPromoCode < ActiveRecord::Migration
  def change
    add_column :promo_codes, :discount, :decimal
  end
end
