json.extract! series, :id, :name, :summary, :description, :created_at, :updated_at
json.url series_url(series, format: :json)