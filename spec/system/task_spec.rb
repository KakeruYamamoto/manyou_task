require 'rails_helper'

RSpec.describe "タスク管理機能", type: :system do
  before do
   # あらかじめタスク一覧のテストで使用するためのタスクを二つ作成する

   # backgroundの中に記載された記述は、そのカテゴリ内（describe "タスク管理機能", type: :system do から endまでの内部）
   # に存在する全ての処理内（scenario内）で実行される
   # （「タスク一覧のテスト」でも「タスクが作成日時の降順に並んでいるかのテスト」でも、background内のコードが実行される）
   # @task1 =  Task.create!(task_name: 'test_task_01', task_content: 'testtesttest')
   # @task2 = Task.create!(task_name: 'test_task_02', task_content: 'mofmofmofmof')
   # @task3 = Task.create!(task_name: 'test_task_03', task_content: 'samplesamplesample')
  #
  # @task1 = FactoryBot.create(:task)
  # @task2 = FactoryBot.create(:second_task)
  # @task3 = FactoryBot.create(:third_task)

  @user1 = FactoryBot.create(:user_first)
  # sign_in @user1
  # @user2 = FactoryBot.create(:second_user)
  # @user3 = FactoryBot.create(:third_user)

  end

  scenario 'タスク一覧のテスト' do
    # @task = Task.create(task_name: 'aaaaaa',task_content: 'aaaaaa')

    visit session_path
    save_and_open_page
    # fill_in 'User name', with: @user1.email
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    # fill_in 'Password confirmation', with: @user1.password
    click_button 'Create User'

    visit new_user_path

    fill_in "タスク名", with: 'task'
    fill_in "タスク詳細", with: 'task'

    expect(page).to have_content 'test_task_01'

  end
  #
  # scenario 'タスク作成のテスト' do
  #
  #   visit new_task_path
  #
  #   fill_in "タスク名", with: 'task'
  #   fill_in "タスク詳細", with: 'task'
  #
  #   click_on '登録する'
  #   expect(page).to have_content 'task'
  #
  # end
  #
  # scenario 'タスク詳細のテスト' do
  #
  #   visit tasks_path(@task1.id)
  #
  #   expect(page).to have_content 'test_task_01'
  #
  # end
  #
  #
  # scenario "タスクが作成日時の降順に並んでいるかのテスト" do
  #
  #   visit tasks_path
  #   first(:link, "詳細").click
  #   expect(page).to have_text "test_task_03"
  # end
  #
  # scenario "終了期限のテスト" do
  #
  #   visit tasks_path
  #   first(:link, "詳細").click
  #   expect(page).to have_text "2019/11/24"
  # end
  #
  # scenario "ステータスのテスト" do
  #
  #   visit tasks_path
  #   first(:link, "詳細").click
  #   expect(page).to have_text "完了"
  # end
  #
  # scenario "検索ロジックのmodelのテスト" do
  #
  #   visit tasks_path
  #
  #   fill_in "search_task_names", with: 'test_task_03'
  #   select "完了", from: "task[status]"
  #   click_on '検索'
  #   expect(page).to have_content 'test_task_03',"完了"
  #
  #
  #
  # end


end
