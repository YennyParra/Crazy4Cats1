json.extract! catcomment, :id, :content, :article_id, :catuser_id, :created_at, :updated_at
json.url catcomment_url(catcomment, format: :json)
