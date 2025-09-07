require 'rails_helper'

RSpec.describe Cat, type: :model do
  context 'Validation tests' do
    it 'is not valid without a name' do
      user = User.create(first_name: "john", last_name: "doe", username: "johndoe", email: "johndoe123@gmail.com")
      cat = Cat.new(user: user)
      expect(cat).to_not be_valid
      expect(cat.errors[:name]).to include("can't be blank") # Optional
      end
    end
  it 'is not valid without a user' do
    cat = Cat.new(name: 'Whiskers')
    expect(cat).to_not be_valid
    expect(cat.errors[:user]).to include("must exist") # Optional
  end
  end

