# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    title { 'キャベツ' }
    question { '生育が悪い。枯れてしまった。' }
    association :user
  end
end
