json.extract! number, :id, :created_at, :updated_at, :phone_number, :commment
json.url person_url(number, format: :json)
