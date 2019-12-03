require 'rails_helper'

RSpec.describe "タスク管理機能", type: :system do
  before do

    @user1 = FactoryBot.create(:first_user)

    @task1 = FactoryBot.create(:task, user_id: @user1.id)
    @task2 = FactoryBot.create(:second_task, user_id: @user1.id)
    @task3 = FactoryBot.create(:third_task, user_id: @user1.id)
    @label1 = FactoryBot.create(:label_one)
    @label2 = FactoryBot.create(:label_two)
    @label3 = FactoryBot.create(:label_tree)
  end

  before(:each) do
    visit new_session_path
    fill_in 'session[email]', with: @user1.email
    fill_in 'session[password]', with: @user1.password
    click_on "Log in"
  end

  scenario 'タスク一覧のテスト' do
    visit tasks_path
    expect(page).to have_content 'test_task_01'
  end

  scenario 'タスク作成のテスト' do
    visit new_task_path
    fill_in "タスク名", with: 'task'
    fill_in "タスク詳細", with: 'task'
    click_on '登録する'
    expect(page).to have_content 'task'
  end

  scenario 'タスク詳細のテスト' do
    visit tasks_path(@task1.id)
    expect(page).to have_content 'test_task_01'
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit tasks_path
    first(:link, "詳細").click
    expect(page).to have_text "test_task_03"
  end

  scenario "終了期限のテスト" do
    visit tasks_path
    first(:link, "詳細").click
    expect(page).to have_text "2019/11/24"
  end

  scenario "ステータスのテスト" do
    visit tasks_path
    first(:link, "詳細").click
    expect(page).to have_text "完了"
  end

  scenario "検索ロジックのmodelのテスト" do
    visit tasks_path
    fill_in "search_task_names", with: 'test_task_03'
    select "完了", from: "task[status]"
    click_on '検索'
    expect(page).to have_content 'test_task_03',"完了"
  end

  scenario "ラベルのテスト" do

    visit tasks_path

    first(:link, "編集").click
    check 'task_label_ids_1'
    click_on '登録する'
    expect(page).to have_text "ラベル１"
  end

  scenario "ラベル検索のテスト" do
    visit tasks_path
    select "ラベル１", from: "label_id"
    click_on 'Search'
    expect(page).to have_content "ラベル１"
  end
end
