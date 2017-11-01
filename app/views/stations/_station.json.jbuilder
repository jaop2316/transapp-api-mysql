json.extract! station, :id, :codParada, :nomParada, :latParada, :lonParada, :created_at, :updated_at, :routes
json.url station_url(station, format: :json)
