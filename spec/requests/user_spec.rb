require 'rails_helper'


RSpec.describe "User", type: :request do
    describe "GET /signup" do
      it "gets the index" do
        get signup_path
        expect(response).to have_http_status(200)
      end
    end
  end