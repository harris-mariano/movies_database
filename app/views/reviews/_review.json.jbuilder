json.extract! review, :id, :movie_id, :comment, :score, :created_at, :updated_at
json.url review_url(review, format: :json)
