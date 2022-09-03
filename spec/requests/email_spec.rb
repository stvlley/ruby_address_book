require 'rails_helper'

RSpec.describe "Email", type: :request do
    describe "GET /people/:person_id/emails/new" do
      it "takes you to the page to create a email" do
        user = User.first_or_create!(name: "Roger", email: "roger@test.com", password: "secret", password_confirmation: "secret")
        person = Person.create!(user: user, first_name: 'James', last_name: 'Rodriguese')      
  
        get "/people/#{person.id}/emails/new"
        
        expect(response).to have_http_status(200)
        expect(response).to render_template(:new)
      end
    end
  end

  RSpec.describe "Email", type: :request do
    describe "GET /people/:id/emails/:id/edit" do
      it "takes you to the page to edit the email selected and renders the edit template" do
        user = User.first_or_create!(name: "Roger", email: "roger@test.com", password: "secret", password_confirmation: "secret")
        person = Person.create!(user: user, first_name: 'James', last_name: 'Rodriguese')  
        email = Email.create!(person_id: person.id, email: "email@test.com", comment: '')    
    
        get "/people/#{person.id}/emails/#{email.id}/edit"
        
        expect(response).to have_http_status(200)
        expect(response).to render_template(:edit)
      end
    end
  end