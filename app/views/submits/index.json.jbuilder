json.array!(@submits) do |submit|
  json.extract! submit, :id, :user_id, :exercise_id, :result, :try_count
  json.url submit_url(submit, format: :json)
end
