# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ユーザ管理機能', type: :system do
  before do
    @user1 = FactoryBot.create(:first_user)
    @user2 = FactoryBot.create(:second_user)
    @user3 = FactoryBot.create(:third_user)

    @task1 = FactoryBot.create(:task, user_id: @user1.id)
    @task2 = FactoryBot.create(:second_task, user_id: @user1.id)
    @task3 = FactoryBot.create(:third_task, user_id: @user1.id)
  end

  before(:each) do
    visit new_session_path
    fill_in 'session[email]', with: @user1.email
    fill_in 'session[password]', with: @user1.password
    click_on 'サインイン'
  end

  scenario 'ユーザ一覧のテスト' do
    visit admin_users_path
    expect(page).to have_content 'test_user1'
  end

  scenario 'ユーザ作成のテスト' do
    visit new_admin_user_path
    fill_in 'user[user_name]', with: 'test_user1'
    fill_in 'user[email]', with: 'test_user1test_user1@gmail.com'
    fill_in 'user[password]', with: 'test_user1@gmail.comtest_user1@gmail.com'
    fill_in 'user[password_confirmation]', with: 'test_user1@gmail.comtest_user1@gmail.com'
    click_on '登録'
    expect(page).to have_content 'test_user1'
  end

  scenario 'ユーザ詳細のテスト' do
    visit admin_user_path(@user1.id)
    expect(page).to have_content 'test_task_01'
    expect(page).to have_content 'test_task_02'
    expect(page).to have_content 'test_task_03'
  end

  scenario 'ユーザ更新テスト' do
    visit edit_user_path(@user1.id)
    fill_in 'user[user_name]', with: 'test_user333'
    fill_in 'user[email]', with: 'test_user1@gmail.com'
    fill_in 'user[password]', with: 'test_userrrrrrrrrr@gmail.com'
    fill_in 'user[password_confirmation]', with: 'test_userrrrrrrrrr@gmail.com'
    click_on '登録'
    expect(page).to have_text 'test_user333'
  end

  scenario 'ユーザ削除テスト' do
    visit admin_users_path
    first(:link, '削除').click
    page.driver.browser.switch_to.alert.accept
    expect(page).to_not have_text 'test_user3'
  end
end
