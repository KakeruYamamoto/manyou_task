FactoryBot.define do

  factory :task do
    task_name { 'Factoryで作ったデフォルトのタイトル１' }
    task_content { 'Factoryで作ったデフォルトのコンテント１' }
  end

  factory :second_task, class: Task do
    task_name { 'Factoryで作ったデフォルトのタイトル２' }
    task_content { 'Factoryで作ったデフォルトのコンテント２' }
  end

  factory :third_task, class: Task do
    task_name { 'Factoryで作ったデフォルトのタイトル３' }
    task_content { 'Factoryで作ったデフォルトのコンテント３' }
  end
end
