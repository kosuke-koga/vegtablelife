require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with name, email and password" do
    user = FactoryBot.build(:user, image: nil, text: nil)
    expect(user).to be_valid
  end

  it "is not valid without name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is not valid without email" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is not valid without password" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "is not valid when name length is 1" do
    # user = FactoryBot.create(:user, name: "a")
    
    # expect{user.errors[:name]}.to include("Name is too short")
  end

  it "is valid when name length is 2" do
    # user = FactoryBot.build(:user, name: "a"*2)
    # expect(user.errors[:name]).to be_present
  end

  it "is not valid when name length is 21" do
  end

  it "is valid when name length is 20" do
  end

  it "is not valid when password length is 5" do
  end

  it "is valid when password length is 6" do
  end

  it "is not valid when password length is 101" do
  end

  it "is valid when password length is 100" do
  end

end
