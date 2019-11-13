require 'rails_helper'

RSpec.describe Task, type: :system do
  describe 'タスク一覧画面' do
    context 'タスクを作成した場合' do
      it '作成済みのタスクが表示されること' do
        @task = Task.create(task_name: "bbbbbb")

        visit tasks_path

        expect(page).to have_content 'bbbbbb'
      end
    end
  end

  describe 'タスク登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存されること'do

      visit new_task_path

      fill_in "タスク名", with: 'task'
      fill_in "タスク詳細", with: 'task'

      click_on '登録する'
      expect(page).to have_content 'task'
      end
    end
  end

  describe 'タスク詳細画面' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示されたページに遷移すること' do

        @task = Task.create(task_name: "bbbbbb")
        visit tasks_path

        click_on 'Show'

        expect(page).to have_content 'Task name:'
     end
  end
end
end
