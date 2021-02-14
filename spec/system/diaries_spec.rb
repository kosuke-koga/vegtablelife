# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Diaries', type: :system do
  it 'user create a new diary' do
    user = FactoryBot.create(:user)

    visit root_path
    click_link 'ログイン'
    fill_in 'user[name]',  with: user.name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'

    expect do
      click_link '投稿する'
      fill_in 'diary[vegtable]', with: 'キャベツ'
      fill_in 'diary[action]', with: '収穫'
      fill_in 'diary[text]', with: '今日もいい天気'
      click_button '投稿'
      expect(page).to have_content 'キャベツ'
      expect(page).to have_content '収穫'
    end.to change { user.diaries.count }.by(1)
  end
end
