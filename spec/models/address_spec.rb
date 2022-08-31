require 'rails_helper'

RSpec.describe Address, type: :model do
  
  it "is not valid without a street" do
    address = Address.new(street: nil)
    expect(address).not_to be_valid
  end

  it "is not valid without a town" do 
    address = Address.new(town: nil)
    expect(address).not_to be_valid
  end

  it "is not valid without a zipcode" do 
    address = Address.new(zipcode: nil)
    expect(address).not_to be_valid
  end
end
