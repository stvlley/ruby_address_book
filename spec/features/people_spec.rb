require 'rails_helper'

RSpec.describe 'authentication' do 
    describe 'viewing the root page requires you to be logged in' do 
        it "asks you to login or signup when arriving on root path" do
            
             visit('/')

        expect(page).to have_content("Log In Sign Up")
        end
    end
end


RSpec.describe 'Creating a contact' do 
    describe 'viewing the people page requires you to be logged in' do 
        it "after a successfull log in a user is then able to create a new contact" do
            
             visit(new_person_path)

             fill_in('Name', with: "Bobby")
             fill_in('Email', with: "email@email.com")
             fill_in('Password', with: "password")
             fill_in('Password confirmation', with: "password")

             click_button("Create User")

        expect(page).to have_content("Contacts")
        expect(page).to have_content('New contact')

            click_link('New contact')

            fill_in('First name', with: "Bobby")
            fill_in('Middle name', with: "Middle")
            fill_in('Last name', with: "Garza")
             
            click_button("Create Person")

            expect(page).to have_content("Person was successfully created.")
            expect(page).to have_content("Bobby")
        end
    end
end


RSpec.describe 'Signing Up' do 
    describe 'A user is able to sign up and then be directed to the root path' do 
        it "signs you up for a account then directs you to the people index page " do
            
             visit(new_person_path)

             fill_in('Name', with: "Bobby")
             fill_in('Email', with: "email@email.com")
             fill_in('Password', with: "password")
             fill_in('Password confirmation', with: "password")

             click_button("Create User")

        expect(page).to have_content("You have successfully signed up.")
        expect(page).to have_content('New contact')
        end
    end
end