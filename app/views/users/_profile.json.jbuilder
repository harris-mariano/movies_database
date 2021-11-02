json.extract! profile, :id, :created_at, :updated_at
json.url user_url(profile, format: :json)
