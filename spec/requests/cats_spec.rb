require 'rails_helper'

RSpec.describe "Cats API", type: :request do
  let!(:user) do
    User.create!(
      first_name: "Millisa",
      last_name: "Gaietto",
      username: "mgaietto",
      email: "test@example.com",
      password: "password123"
    )
  end

  let!(:cat1) { user.cats.create!(name: "Chauncey", age: 9, breed: "American longhair", weight: 8.5, color: "black") }
  let!(:cat2) { user.cats.create!(name: "Libra", age: 3, breed: "American shorthair", weight: 15.5, color: "black and white") }

  describe "GET /users/:user_id/cats" do
    it "returns http success" do
      get "/users/#{user.id}/cats"
      expect(response).to have_http_status(:success)
    end

    it "returns a list of the user's cats" do
      get "/users/#{user.id}/cats"
      json = JSON.parse(response.body)
      expect(json.size).to eq(2)
      expect(json.map { |c| c["name"] }).to include("Chauncey", "Libra")
    end
  end

  describe "GET /users/:user_id/cats/:id" do
    it "returns http success" do
      get "/users/#{user.id}/cats/#{cat1.id}"
      expect(response).to have_http_status(:success)
    end

    it "returns the correct cat" do
      get "/users/#{user.id}/cats/#{cat1.id}"
      json = JSON.parse(response.body)
      expect(json["name"]).to eq("Chauncey")
    end
  end

  describe "POST /users/:user_id/cats" do
    it "creates a new cat" do
      cat_params = { cat: { name: "Snowball", age: 1, breed: "Maine Coon", weight: 10.5, color: "orange" } }
      expect {
        post "/users/#{user.id}/cats", params: cat_params
      }.to change { user.cats.count }.by(1)
      expect(response).to have_http_status(:created)
      json = JSON.parse(response.body)
      expect(json["name"]).to eq("Snowball")
    end
  end
end



