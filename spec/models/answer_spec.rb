# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'Association' do
    let(:association) do
      described_class.reflect_on_association(answer)
    end

    context 'user' do
      let(:answer) { :user }

      it { expect(association.macro).to eq :belongs_to }
      it { expect(association.class_name).to eq 'User' }
    end

    context 'question' do
      let(:answer) { :question }

      it { expect(association.macro).to eq :belongs_to }
      it { expect(association.class_name).to eq 'Question' }
    end
  end
end
