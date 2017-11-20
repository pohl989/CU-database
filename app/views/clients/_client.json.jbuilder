json.extract! client, :id, :first_name, :middle_name, :last_name, :preferred_name, :created_at, :updated_at
json.url client_url(client, format: :json)
