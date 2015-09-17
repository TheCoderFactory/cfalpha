json.array!(@prequestionnaires) do |prequestionnaire|
  json.extract! prequestionnaire, :id, :course_booking_id, :reason, :background, :experience, :hobbies
  json.url prequestionnaire_url(prequestionnaire, format: :json)
end
