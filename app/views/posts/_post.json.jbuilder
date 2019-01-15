json.extract! post, :id, :user_ID, :body, :created_at, :updated_at
json.url post_url(post, format: :json)
