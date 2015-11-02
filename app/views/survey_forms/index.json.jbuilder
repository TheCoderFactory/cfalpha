json.array!(@survey_forms) do |survey_form|
  json.extract! survey_form, :id, :user_id, :name, :email, :industry, :skills, :company, :comments
  json.url survey_form_url(survey_form, format: :json)
end
