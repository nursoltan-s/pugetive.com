json.array!(@wields) do |wield|
  json.extract! wield, :id, :tool_id, :project_id
  json.url wield_url(wield, format: :json)
end
