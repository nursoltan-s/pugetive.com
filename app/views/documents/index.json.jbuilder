json.array!(@documents) do |document|
  json.extract! document, :id, :name, :description, :user_id, :documentable_id, :documentable_type, :data
  json.url document_url(document, format: :json)
end
