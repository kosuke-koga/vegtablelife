# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Association' do
    let(:association) do
      described_class.reflect_on_association(like)
    end

    context 'user' do
      let(:like) { :user }

      it { expect(association.macro).to eq :belongs_to }
      it { expect(association.class_name).to eq 'User' }
    end

    context 'diary' do
      let(:like) { :diary }

      it { expect(association.macro).to eq :belongs_to }
      it { expect(association.class_name).to eq 'Diary' }
    end
  end
end
