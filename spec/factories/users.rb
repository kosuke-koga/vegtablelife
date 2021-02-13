# frozen_string_literal: true

FactoryBot.define do
  factory :user, aliases: [:owner] do
    name 'kosuke'
    image 'image_picture'
    text 'web系企業への転職を成功させるためポートフォリオ作成中'
    sequence(:email) { |n| "tester#{n}@example.com" }
    password 'dottle-nouveau-pavilion-tights-furze'
  end
end
