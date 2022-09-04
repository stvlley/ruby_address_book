require 'rails_helper'

RSpec.describe 'GET /people/:id/numbers/new' do 
    describe 'A user is able to create an number for the person' do 
        it "signs a user up then fills the form in and submits successfully " do

         user = User.first_or_create!(name: "Roger", email: "roger@test.com", password: "secret", password_confirmation: "secret")
         person = Person.create!(user: user, first_name: 'James', last_name: 'Rodriguese')      

         visit("/people/#{person.id}/numbers/new")
            
         fill_in('Phone number', with: "123-123-1231")
         
         click_button("Create Number")

         expect(page).to have_http_status(200)
        end
    end
end


RSpec.describe 'Updating a Number' do 
    describe 'viewing the numbers page requires you to be logged in' do 
        it "after a successfull log in a user is then able to create a new contact and update a number" do
            
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

            find("#create-number").click

            fill_in('Phone number', with: "123-123-1232")
            
            click_button("Create Number")

            expect(page).to have_content("Number was successfully created.")
        end
    end
end

RSpec.describe 'Creating a Number' do 
    describe 'viewing the numbers page requires you to be logged in' do 
        it "after a successfull log in a user is then able to create a new contact and number" do
            
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

            find("#create-number").click

            fill_in('Phone number', with: "123-123-1232")
            
            click_button("Create Number")

            find("#update-number").click

            fill_in('Phone number', with: "123-111-1111")

            click_button("Update Number")

            expect(page).to have_content("Person was successfully updated.")
        end
    end
end