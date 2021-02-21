# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comments', type: :system do
  it 'create a new comment', js: true do
    user = FactoryBot.create(:user)
    diary = FactoryBot.create(:diary)

    visit root_path
    find('.log').click
    fill_in 'user[name]',  with: user.name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'

    click_link '詳　細'
    find('#open').click
    fill_in 'comment[comment]', with: '美味しそう！'
    click_button '送信'

    expect(page).to have_content '美味しそう！'
  end
end
