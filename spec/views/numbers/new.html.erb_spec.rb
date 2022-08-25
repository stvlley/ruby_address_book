require 'rails_helper'

RSpec.describe "numbers/new", type: :view do
  before(:each) do
    assign(:number, Number.new())
  end

  it "renders new number form" do
    render

    assert_select "form[action=?][method=?]", numbers_path, "post" do
    end
  end
end
