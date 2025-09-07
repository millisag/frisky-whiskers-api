require 'rails_helper'

RSpec.describe "Users API", type: :request do
  describe "POST /users" do
    let(:valid_attributes) do
      {
        first_name: "Millisa",
        last_name: "Gaietto",
        username: "mgaietto",
        email: "test@example.com",
        password: "password123",
        password_confirmation: "password123"
      }
    end

    let(:invalid_attributes) do
      {
        first_name: "",
        last_name: "",
        username: "",
        email: "invalid-email",
        password: "",
        password_confirmation: ""
      }
    end

    context "with valid parameters" do
      it "creates a new user" do
        expect {
          post "/users", params: valid_attributes
        }.to change(User, :count).by(1)

        expect(response).to have_http_status(:created)
        json = JSON.parse(response.body)
        expect(json["username"]).to eq("mgaietto")
        expect(json["email"]).to eq("test@example.com")
      end
    end

    context "with invalid parameters" do
      it "does not create a user and returns errors" do
        expect {
          post "/users", params: invalid_attributes
        }.to_not change(User, :count)

        expect(response).to have_http_status(422)
        json = JSON.parse(response.body)
        expect(json["errors"]).to include("First name can't be blank")
        expect(json["errors"]).to include("Last name can't be blank")
        expect(json["errors"]).to include("Username can't be blank")
      end
    end
  end
end

