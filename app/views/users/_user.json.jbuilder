json.extract! user, :id, :name, :bio, :photo, :updated_at, :created_at, :postCounter, :created_at, :updated_at
json.url user_url(user, format: :json)
