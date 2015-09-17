json.array!(@courses) do |course|
  json.extract! course, :id, :course_type_id, :name, :tagline, :description, :active, :slug
  json.url course_url(course, format: :json)
end
