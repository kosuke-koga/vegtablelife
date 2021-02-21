# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with name, email and password' do
    user = FactoryBot.build(:user, icon: nil, text: nil)
    expect(user).to be_valid
  end

  it 'is not valid without name' do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it 'is not valid without email' do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it 'is not valid without password' do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  it 'has a valid factory' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it 'is not valid when name length is 1' do
    user = FactoryBot.build(:user, name: 'a')
    user.valid?
    expect(user.errors[:name]).to include('は2文字以上で入力してください')
  end

  it 'is valid when name length is 2' do
    user = FactoryBot.build(:user, name: 'a' * 2)
    user.valid?
    expect(user).to be_valid
  end

  it 'is not valid when name length is 21' do
    user = FactoryBot.build(:user, name: 'a' * 21)
    user.valid?
    expect(user.errors[:name]).to include('は20文字以内で入力してください')
  end

  it 'is valid when name length is 20' do
    user = FactoryBot.build(:user, name: 'a' * 20)
    user.valid?
    expect(user).to be_valid
  end

  it 'is not valid when password length is 5' do
    user = FactoryBot.build(:user, password: 'a' * 5)
    user.valid?
    expect(user.errors[:password]).to include('は6文字以上で入力してください')
  end

  it 'is valid when password length is 6' do
    user = FactoryBot.build(:user, password: 'a' * 6)
    user.valid?
    expect(user).to be_valid
  end

  it 'is not valid when text length is 101' do
    user = FactoryBot.build(:user, text: 'a' * 101)
    user.valid?
    expect(user.errors[:text]).to include('は100文字以内で入力してください')
  end

  it 'is valid when text length is 100' do
    user = FactoryBot.build(:user, text: 'a' * 100)
    user.valid?
    expect(user).to be_valid
  end
end
