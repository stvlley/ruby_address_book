require 'rails_helper'

RSpec.describe "Number", type: :request do
    describe "GET /people/:person_id/numbers/new" do
      it "takes you to the page to create a number" do
        user = User.first_or_create!(name: "Roger", email: "roger@test.com", password: "secret", password_confirmation: "secret")
        person = Person.create!(user: user, first_name: 'James', last_name: 'Rodriguese')      
  
        get "/people/#{person.id}/numbers/new"
        
        expect(response).to have_http_status(200)
        expect(response).to render_template(:new)
      end
    end
  end

  RSpec.describe "Number", type: :request do
    describe "GET /people/:id/numbers/:id/edit" do
      it "takes you to the page to edit the number selected and renders the number template" do
        user = User.first_or_create!(name: "Roger", email: "roger@test.com", password: "secret", password_confirmation: "secret")
        person = Person.create!(user: user, first_name: 'James', last_name: 'Rodriguese')  
        number = Number.create!(person_id: person.id, phone_number: "123121231", commment: '')    
    
        get "/people/#{person.id}/numbers/#{number.id}/edit"
        
        expect(response).to have_http_status(200)
        expect(response).to render_template(:edit)
      end
    end
  end