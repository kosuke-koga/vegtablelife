require 'rails_helper'

RSpec.describe Diary, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it "is valid with action and date" do
    diary = FactoryBot.build(:diary, vegtable: nil, text: nil)
    expect(diary).to be_valid
  end


  it "is invalid without action" do
    diary = FactoryBot.build(:diary, action: nil)
    diary.valid?
    expect(diary.errors[:action]).to include("can't be blank")
  end

  it "is invalid without date" do
    diary = FactoryBot.build(:diary, date: nil)
    diary.valid?
    expect(diary.errors[:date]).to include("can't be blank")
  end

end
