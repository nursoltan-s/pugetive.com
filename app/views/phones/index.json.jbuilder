json.array!(@phones) do |phone|
  json.extract! phone, :id, :number, :category
  json.url phone_url(phone, format: :json)
end
