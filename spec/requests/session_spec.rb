require 'rails_helper'

RSpec.describe "Session", type: :request do
    describe "GET /login" do
      it "take you to the login page so a user can sign up" do
        get login_path
        expect(response).to have_http_status(200)
      end
    end
  end

  RSpec.describe "Session", type: :request do
    describe "GET /logout" do
      it "destroy a users session (logout)" do
        delete logout_path
        expect(response).to have_http_status(302)
      end
    end
  end
