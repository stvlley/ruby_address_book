json.extract! email, :id, :created_at, :updated_at, :email, :comment
json.url person_emails_url(email, format: :json)
