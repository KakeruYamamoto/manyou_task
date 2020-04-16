# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @user = FactoryBot.create(:first_user)
  end
  it 'titleが空ならバリデーションが通らない' do
    task = Task.new(task_name: '', task_content: '失敗テスト', user_id: @user.id )
    expect(task).not_to be_valid
  end

  it 'contentが空ならバリデーションが通らない' do
    task = Task.new(task_name: '失敗テスト', task_content: '', user_id: @user.id )
    expect(task).not_to be_valid
  end

  it 'titleとcontentに内容が記載されていればバリデーションが通る' do
    task = Task.new(task_name: '成功テスト', task_content: '成功テスト', user_id: @user.id )
    expect(task).to be_valid
  end
end
