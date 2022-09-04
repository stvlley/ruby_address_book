require 'rails_helper'

RSpec.describe 'GET /people/:id/emails/new' do 
    describe 'A user is able to create an email for the person' do 
        it "signs a user up then fills the form in and submits successfully " do

         user = User.first_or_create!(name: "Roger", email: "roger@test.com", password: "secret", password_confirmation: "secret")
         person = Person.create!(user: user, first_name: 'James', last_name: 'Rodriguese')      

         visit("/people/#{person.id}/emails/new")
            
         fill_in('Email', with: "email@test.com")
         
         click_button("Create Email")

         expect(page).to have_http_status(200)
        end
    end
end

RSpec.describe 'Creating a Email' do 
    describe 'viewing the emails page requires you to be logged in' do 
        it "after a successfull log in a user is then able to create a new contact and email" do
            
             visit(new_person_path)

             fill_in('Name', with: "Bobby")
             fill_in('Email', with: "email@email.com")
             fill_in('Password', with: "password")
             fill_in('Password confirmation', with: "password")

             click_button("Create User")

            click_link('New contact')

            fill_in('First name', with: "Bobby")
            fill_in('Middle name', with: "Middle")
            fill_in('Last name', with: "Garza")
             
            click_button("Create Person")

            find("#create-email").click

            fill_in('Email', with: "email@test.com")
            
            click_button("Create Email")

            expect(page).to have_content("Email was successfully created.")
        end
    end
end

RSpec.describe 'Updating a Email' do 
    describe 'viewing the emails page requires you to be logged in' do 
        it "after a successfull log in a user is then able to create a new contact and update a email" do
            
             visit(new_person_path)

             fill_in('Name', with: "Bobby")
             fill_in('Email', with: "email@email.com")
             fill_in('Password', with: "password")
             fill_in('Password confirmation', with: "password")

             click_button("Create User")

            click_link('New contact')

            fill_in('First name', with: "Bobby")
            fill_in('Middle name', with: "Middle")
            fill_in('Last name', with: "Garza")
             
            click_button("Create Person")

            find("#create-email").click

            fill_in('Email', with: "email@test.com")
            
            click_button("Create Email")

            find("#update-email").click

            fill_in('Email', with: "emailupdate@test.com")

            click_button("Update Email")

            expect(page).to have_content("Email was successfully updated.")
        end
    end
end
