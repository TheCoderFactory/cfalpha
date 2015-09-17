json.array!(@enquiry_types) do |enquiry_type|
  json.extract! enquiry_type, :id, :name, :description
  json.url enquiry_type_url(enquiry_type, format: :json)
end
