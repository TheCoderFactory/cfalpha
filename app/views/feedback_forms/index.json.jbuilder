json.array!(@feedback_forms) do |feedback_form|
  json.extract! feedback_form, :id, :course_id, :course_location_id, :expectations, :recommend, :another, :satisfaction, :value, :best_part, :comments, :testimonial
  json.url feedback_form_url(feedback_form, format: :json)
end
