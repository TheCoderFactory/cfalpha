json.array!(@profiles) do |profile|
  json.extract! profile, :id, :picture, :phone, :github, :twitter, :linkedin, :gender, :age, :referral, :referral_other
  json.url profile_url(profile, format: :json)
end
