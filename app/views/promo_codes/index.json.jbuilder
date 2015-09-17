json.array!(@promo_codes) do |promo_code|
  json.extract! promo_code, :id, :name, :description, :price_value, :percent_value, :expiry_date, :user_id, :code, :course_intake_id, :creator_id, :date_used
  json.url promo_code_url(promo_code, format: :json)
end
