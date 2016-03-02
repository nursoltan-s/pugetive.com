json.array!(@accounts) do |account|
  json.extract! account, :id, :company, :username, :url
  json.url account_url(account, format: :json)
end
