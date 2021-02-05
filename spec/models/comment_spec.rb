require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is valid comment" do
    comment = FactoryBot.build(:comment)
    expect(comment).to be_valid
  end

  it "is not valid without comment" do
    comment = FactoryBot.build(:comment, comment: nil)
    comment.valid?
    expect(comment.errors[:comment]).to include("can't be blank")
  end

  it "is not valid when comments length 51" do
    comment = FactoryBot.build(:comment, comment: "a"*51)
    comment.valid?
    expect(comment.errors[:comment]).to include("is too long (maximum is 50 characters)")
  end

  it "is valid when comments length 50" do
    comment = FactoryBot.build(:comment, comment: "a"*50)
    expect(comment).to be_valid
  end
end
