require 'rails_helper'

RSpec.describe Number, type: :model do

  it "is not valid without a phone number" do
  number = Number.new(phone_number: nil)
  expect(number).not_to be_valid
end

describe "associtations" do 
  it { should belong_to(:person) }
end

end


