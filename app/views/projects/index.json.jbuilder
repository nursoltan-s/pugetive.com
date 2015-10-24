json.array!(@projects) do |project|
  json.extract! project, :id, :name, :type, :party_id, :url, :start_year, :stop_year, :description, :live
  json.url project_url(project, format: :json)
end
