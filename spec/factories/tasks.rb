FactoryBot.define do

  factory :task do

    task_name { 'test_task_01' }
    task_content { 'Factoryで作ったデフォルトのコンテント１' }

  end

  factory :second_task, class: Task do

    task_name { 'test_task_02' }
    task_content { 'Factoryで作ったデフォルトのコンテント２' }


  end

  factory :third_task, class: Task do

    task_name { 'test_task_03' }
    task_content { 'Factoryで作ったデフォルトのコンテント３' }
    deadline {'2019/11/24'}
    status {'完了'}
  end
end
