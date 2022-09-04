require 'rails_helper'


RSpec.describe 'GET /people/:id/addresses/new' do 
    describe 'A user is able to create an address for the person' do 
        it "signs a user up then fills the form in and submits successfully " do

         user = User.first_or_create!(name: "Roger", email: "roger@test.com", password: "secret", password_confirmation: "secret")
         person = Person.create!(user: user, first_name: 'James', last_name: 'Rodriguese')      

         visit("/people/#{person.id}/addresses/new")
            
         fill_in('Street', with: "123 abc st")
         fill_in('Town', with: "austin")
         fill_in('Zipcode', with: "12345")
         
         click_button("Create Address")

         expect(page).to have_http_status(200)
        end
    end
end

RSpec.describe 'Creating a Address' do 
    describe 'viewing the address page requires you to be logged in' do 
        it "after a successfull log in a user is then able to create a new contact and addess" do
            
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

            find("#create-address").click

            fill_in('Street', with: "123 abc st")
            fill_in('Town', with: "austin")
            fill_in('Zipcode', with: "12345")
            
            click_button("Create Address")

            expect(page).to have_content("Address was successfully created.")
        end
    end
end
RSpec.describe 'Updating a Address' do 
    describe 'viewing the address page requires you to be logged in' do 
        it "after a successfull log in a user is then able to create a new contact and addess" do
            
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

            find("#create-address").click

            fill_in('Street', with: "123 abc st")
            fill_in('Town', with: "austin")
            fill_in('Zipcode', with: "12345")
            
            click_button("Create Address")

            find("#update-address").click

            fill_in('Street', with: "12323 abccx st")
            fill_in('Town', with: "boston")
            fill_in('Zipcode', with: "122222")

            click_button("Update Address")

            expect(page).to have_content("Address was successfully updated.")
            
        end
    end
end