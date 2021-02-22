# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Diary, type: :model do
  describe 'validate test' do
    before do
      @user = FactoryBot.create(:user)
    end

    it 'is valid with action and date' do
      diary = FactoryBot.build(:diary, vegtable: nil, text: nil)
      expect(diary).to be_valid
    end

    it 'is invalid without action' do
      diary = FactoryBot.build(:diary, action: nil)
      diary.valid?
      expect(diary.errors[:action]).to include('を入力してください')
    end

    it 'is invalid without date' do
      diary = FactoryBot.build(:diary, date: nil)
      diary.valid?
      expect(diary.errors[:date]).to include('を入力してください')
    end
  end

  describe 'Association' do
    let(:association) do
      described_class.reflect_on_association(diary)
    end

    context 'user' do
      let(:diary) { :user }

      it { expect(association.macro).to eq :belongs_to }
      it { expect(association.class_name).to eq 'User' }
    end

    context 'comment' do
      let(:diary) { :comments }

      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'Comment' }
    end

    context 'like' do
      let(:diary) { :likes }

      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'Like' }
    end
  end
end
