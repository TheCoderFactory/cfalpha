json.array!(@skill_categories) do |skill_category|
  json.extract! skill_category, :id, :name, :description, :active
  json.url skill_category_url(skill_category, format: :json)
end
