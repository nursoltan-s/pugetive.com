json.array!(@roles) do |role|
  json.extract! role, :id, :project_id, :title_id
  json.url role_url(role, format: :json)
end
