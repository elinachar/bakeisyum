json.extract! instagram_post, :id, :created_at, :updated_at
json.url instagram_post_url(instagram_post, format: :json)
