require 'rails_helper'

RSpec.describe "People", type: :request do
  describe "GET /people" do
    it "gets the index" do
      get people_path
      expect(response).to have_http_status(302)
    end
  end
end

RSpec.describe "People", type: :request do
  describe "GET /people/new" do
    it "gets the page to add a perosn" do
      get new_person_path
      expect(response).to have_http_status(302)
    end
  end
end

RSpec.describe "People", type: :request do
  user = User.first_or_create!(name: "Roger", email: "roger@test.com", password: "secret", password_confirmation: "secret")
  person = Person.create!(user: user, first_name: 'James', last_name: 'Rodriguese')      

  describe "GET /people/:id/edit" do
    it "gets the page to edit a perosn" do
      
      get "/people/#{person.id}/edit"
     
      expect(response).to have_http_status(302)
    end
  end
end