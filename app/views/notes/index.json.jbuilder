json.array!(@notes) do |note|
  json.extract! note, :id, :noteable_type, :notable_id, :contents
  json.url note_url(note, format: :json)
end
