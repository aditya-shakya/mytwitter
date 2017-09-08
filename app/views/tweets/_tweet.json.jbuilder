json.extract! tweet, :id, :name, :content, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
