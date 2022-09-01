require 'rails_helper'

RSpec.describe User, type: :model do
  current_user = User.first_or_create!(name: "Roger", email: "roger@test.com", password: "secret", password_confirmation: "secret")
   
  it "is not valid without name" do 
    user = User.new(name: nil)
    expect(user).not_to be_valid
  end

  it "is not valid without a email" do 
    email = Email.new(email: nil) 
    expect(email).not_to be_valid
  end 
  
  describe "associtations" do 
    it { should have_many(:people) }
  end
  
end

