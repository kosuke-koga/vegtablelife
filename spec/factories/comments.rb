FactoryBot.define do
  factory :comment do
    comment '美味しそう！'
    association :user
    association :diary
  end
end
