require 'rails_helper'

RSpec.describe Number, type: :model do
  # subject { Number.new(phone_number: 1232123122, commment: "")}

  # before { subject.save }

it "is not valid without a phone number" do
  number = Number.new(phone_number: nil)
  expect(number).not_to be_valid
end

end


