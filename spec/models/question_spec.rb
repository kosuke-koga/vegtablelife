# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'validates presence' do
    before do
      @user = FactoryBot.create(:user)
    end

    it 'is valid with title and question' do
      question = FactoryBot.build(:question)
      expect(question).to be_valid
    end

    it 'is invalid without title' do
      question = FactoryBot.build(:question, title: nil)
      expect(question).to_not be_valid
    end

    it 'is invalid without question' do
      question = FactoryBot.build(:question, question: nil)
      expect(question).to_not be_valid
    end
  end

  describe 'Assosiation' do
    let(:association) do
      described_class.reflect_on_association(question)
    end

    context 'user' do
      let(:question) { :user }

      it { expect(association.macro).to eq :belongs_to }
      it { expect(association.class_name).to eq 'User' }
    end

    context 'answer' do
      let(:question) { :answers }

      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'Answer' }
    end
  end
end
