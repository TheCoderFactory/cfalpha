json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :post_category_id, :impressions_count, :title, :lead, :content, :image, :slug, :publish, :published_date
  json.url post_url(post, format: :json)
end
