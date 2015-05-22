json.array!(@answers) do |answer|
  json.extract! answer, :id, :user_id, :question_id, :body, :category
  json.url answer_url(answer, format: :json)
end
