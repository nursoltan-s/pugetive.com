json.array!(@awards) do |award|
  json.extract! award, :id, :name, :official_title, :summary, :url, :live, :start_year, :stop_year
  json.url award_url(award, format: :json)
end
