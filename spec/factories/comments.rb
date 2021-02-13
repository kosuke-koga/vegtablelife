# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    comment '美味しそう！'
    association :user
    association :diary
  end
end
