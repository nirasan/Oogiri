json.array!(@questions) do |question|
  json.extract! question, :id, :user_id, :title, :category
  json.url question_url(question, format: :json)
end
