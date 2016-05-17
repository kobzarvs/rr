json.array!(@rel_types) do |rel_type|
  json.extract! rel_type, :id, :name
  json.url rel_type_url(rel_type, format: :json)
end
