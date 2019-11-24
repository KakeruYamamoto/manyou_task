FactoryBot.define do

  factory :task do
    task_name { 'test_task_01' }
    task_content { 'Factoryで作ったデフォルトのコンテント１' }
    # task_content { 'test_task_01' }
    deadline {'2019/11/24'}
    status {'完了'}
  end

  factory :second_task, class: Task do
    task_name { 'test_task_02' }
    task_content { 'Factoryで作ったデフォルトのコンテント２' }
    # task_content { 'test_task_02' }

  end

  factory :third_task, class: Task do
    task_name { 'test_task_03' }
    task_content { 'Factoryで作ったデフォルトのコンテント３' }
    # task_content { 'test_task_03' }
  end
end
