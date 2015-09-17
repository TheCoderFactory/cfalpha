json.array!(@enquiries) do |enquiry|
  json.extract! enquiry, :id, :enquiry_type_id, :first_name, :last_name, :company, :phone, :email, :message, :responded_to, :user_id
  json.url enquiry_url(enquiry, format: :json)
end
