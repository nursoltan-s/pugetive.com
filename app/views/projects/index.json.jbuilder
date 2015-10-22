json.array!(@projects) do |project|
  json.extract! project, :id, :name, :category, :pro, :start_year, :stop_year, :description, :status
  json.url project_url(project, format: :json)
end
