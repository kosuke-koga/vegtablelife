# frozen_string_literal: true

FactoryBot.define do
  factory :user, aliases: [:owner] do
    name { 'kosuke' }
    icon { 'image_picture' }
    text { 'キャベツ作ってます。お気軽にご連絡ください！' }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { 'dottle-nouveau-pavilion-tights-furze' }
  end
end
