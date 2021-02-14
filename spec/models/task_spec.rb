# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    let(:association) do
      described_class.reflect_on_association(task)
    end

    context 'users' do
      let(:task) { :user }

      it { expect(association.macro).to eq :belongs_to }
      it { expect(association.class_name).to eq 'User' }
    end
  end
end
