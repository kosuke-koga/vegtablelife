FactoryBot.define do
  factory :diary, class: 'Diary' do
    vegtable "キャベツ"
    action "収穫"
    text "美味しそうなキャベツが採れました"
    date "2021-02-05" 
    association :user
  end
end
