require 'rails_helper'

RSpec.describe 'authentication' do 
    describe 'viewing the people page requires you to be logged in' do 
        it "shows asks you to login or signup before being able to add people" do
            
            #  user = User.first_or_create!(name: "Roger", email: "roger@test.com", password: "secret", password_confirmation: "secret")
            #  person = Person.create!(user: user, first_name: 'James', last_name: 'Rodriguese') 
        
             visit('/')

        expect(page).to have_content("Log In Sign Up")
        end
    end
end


RSpec.describe 'authentication' do 
    describe 'viewing the people page requires you to be logged in' do 
        it "once logged in user is then able to create a new contact" do
            
            #  user = User.first_or_create!(name: "Roger", email: "roger@test.com", password: "secret", password_confirmation: "secret")
            #  person = Person.create!(user: user, first_name: 'James', last_name: 'Rodriguese') 
        
             visit('/')

             fill_in('Name', with: "Bobby")
             fill_in('Email', with: "email@email.com")
             fill_in('Password', with: "password")
             fill_in('Password confirmation', with: "password")

             click_button("Create User")

        expect(page).to have_content("Contacts")
        expect(page).to have_content('New contact')
        end
    end
end
