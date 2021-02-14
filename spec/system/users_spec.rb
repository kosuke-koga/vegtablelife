# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  it 'edit profile', js: true do
    user = FactoryBot.create(:user)

    visit root_path
    click_link 'ログイン'
    fill_in 'user[name]',  with: user.name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'

    click_link 'マイページ'
    find('#user_show_open').click
    fill_in 'user[name]', with: 'tonakai'
    click_button '更新'
    user.reload
    expect(user.name).to eq 'tonakai'
  end
end
