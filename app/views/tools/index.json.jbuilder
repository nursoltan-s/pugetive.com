json.array!(@tools) do |tool|
  json.extract! tool, :id, :name, :type
  json.url tool_url(tool, format: :json)
end
