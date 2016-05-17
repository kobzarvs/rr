json.array!(@rels) do |rel|
  json.extract! rel, :id, :rel_type_id, :node1, :node2
  json.url rel_url(rel, format: :json)
end
