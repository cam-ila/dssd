json.extract! incident, :id, :client_number, :incident_type, :description, :state, :created_at, :updated_at
json.url incident_url(incident, format: :json)
