json.array!(@exercises) do |exercise|
  json.extract! exercise, :id, :unique_name, :title, :content_body
  json.url exercise_url(exercise, format: :json)
end
