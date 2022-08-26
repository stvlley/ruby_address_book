require 'rails_helper'

RSpec.describe "numbers/show", type: :view do
  before(:each) do
    @number = assign(:number, Number.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
