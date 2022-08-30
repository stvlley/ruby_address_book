json.extract! person, :id, :created_at, :updated_at, :salutation, :first_name, :middle_name, :last_name, :ssn, :birth_date, :comment
json.url person_url(person, format: :json)
