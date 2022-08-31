json.extract! address, :id, :created_at, :updated_at, :street, :town, :zipcode, :state, :country
json.url person_addresses_url(address, format: :json)
