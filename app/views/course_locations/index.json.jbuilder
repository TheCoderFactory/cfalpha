json.array!(@course_locations) do |course_location|
  json.extract! course_location, :id, :name, :city, :address_one, :address_two, :suburb, :state, :postcode, :country, :latitude, :longitude, :slug
  json.url course_location_url(course_location, format: :json)
end
