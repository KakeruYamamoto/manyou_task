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

  @task1 = FactoryBot.create(:task)
  @task2 = FactoryBot.create(:second_task)
  @task3 = FactoryBot.create(:third_task)
  end

  scenario 'タスク一覧のテスト' do
    # @task = Task.create(task_name: 'aaaaaa',task_content: 'aaaaaa')

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
    save_and_open_page
    expect(page).to have_text /.*test_task_03.*\n.*\ntest_task_01.*/
  end

  scenario "終了期限のテスト" do

  end

  scenario "ステータスのテスト" do

  end


end
