json.array!(@subjects) do |subject|
  json.extract! subject, :id, :name, :sub_type_id
  json.url subject_url(subject, format: :json)
end
