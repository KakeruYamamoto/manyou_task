json.extract! task, :id, :task_name, :task_content, :created_at, :updated_at
json.url task_url(task, format: :json)
