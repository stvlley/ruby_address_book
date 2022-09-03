require 'rails_helper'
# RSpec.describe "Widget management", :type => :request do

#   it "creates a Widget and redirects to the Widget's page" do
#     get "/widgets/new"
#     expect(response).to render_template(:new)

#     post "/widgets", :params => { :widget => {:name => "My Widget"} }

#     expect(response).to redirect_to(assigns(:widget))
#     follow_redirect!

#     expect(response).to render_template(:show)
#     expect(response.body).to include("Widget was successfully created.")
#   end

#   it "does not render a different template" do
#     get "/widgets/new"
#     expect(response).to_not render_template(:show)
#   end
# end

RSpec.describe "Address", type: :request do
  describe "GET /people/:person_id/adresses/new" do
    it "takes you to the page to create a address and renders the new template" do
      user = User.first_or_create!(name: "Roger", email: "roger@test.com", password: "secret", password_confirmation: "secret")
      person = Person.create!(user: user, first_name: 'James', last_name: 'Rodriguese')      

      get "/people/#{person.id}/addresses/new"
      
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end
end

RSpec.describe "Address", type: :request do
  describe "GET /people/:id/addresses/:id/edit" do
    it "takes you to the page to edit the address selected and renders the edit template" do
      user = User.first_or_create!(name: "Roger", email: "roger@test.com", password: "secret", password_confirmation: "secret")
      person = Person.create!(user: user, first_name: 'James', last_name: 'Rodriguese')  
      address = Address.create!(street: "123 fox st", town: "austin", zipcode: "12345", state: "texas", country: "US", person_id: person.id)    
  
      get "/people/#{person.id}/addresses/#{address.id}/edit"
      
      expect(response).to have_http_status(200)
      expect(response).to render_template(:edit)
    end
  end
end