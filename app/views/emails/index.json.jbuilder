json.array!(@emails) do |email|
  json.extract! email, :id, :address, :category
  json.url email_url(email, format: :json)
end
