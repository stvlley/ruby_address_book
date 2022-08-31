require 'rails_helper'

RSpec.describe Person, type: :model do
  current_user = User.first_or_create!(name: "Roger", email: "roger@test.com", password: "secret", password_confirmation: "secret")
   
  it "is not valid without a first name" do 
    person = Person.new(first_name: nil)
    expect(person).not_to be_valid
  end

  it "is not valid without a last name" do 
    person = Person.new(last_name: nil) 
    expect(person).not_to be_valid
  end 

end
