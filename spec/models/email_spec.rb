require 'rails_helper'

RSpec.describe Email, type: :model do
  
  it "is not valid without a email" do
    email = Email.new(email: nil)
    expect(email).not_to be_valid
  end
  
  describe "associtations" do 
    it { should belong_to(:person) }
  end

end
