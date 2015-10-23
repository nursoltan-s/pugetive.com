json.array!(@parties) do |party|
  json.extract! party, :id, :name, :type, :url, :description, :start_year, :stop_year
  json.url party_url(party, format: :json)
end
