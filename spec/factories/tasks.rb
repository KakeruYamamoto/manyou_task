# frozen_string_literal: true

FactoryBot.define do
  factory :task, class: Task do
    task_name { 'test_task_01' }
    task_content { 'Factoryで作ったデフォルトのコンテント１' }
    deadline { '2040/11/24' }
    status { '未着手' }
  end

  factory :second_task, class: Task do
    task_name { 'test_task_02' }
    task_content { 'Factoryで作ったデフォルトのコンテント２' }
    deadline { '2030/11/24' }
    status { '着手中' }
  end

  factory :third_task, class: Task do
    task_name { 'test_task_03' }
    task_content { 'Factoryで作ったデフォルトのコンテント３' }
    deadline { '2019/11/24' }
    status { '完了' }
  end
end
