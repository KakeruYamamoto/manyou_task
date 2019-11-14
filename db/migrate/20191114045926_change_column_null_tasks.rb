class ChangeColumnNullTasks < ActiveRecord::Migration[5.2]
  def up
    change_column :tasks, :task_name, :string, null: false
    change_column :tasks, :task_content, :text, null: false
  end

  def down
    change_column :tasks, :task_name, :string, null: false
    change_column :tasks, :task_content, :text, null: false
  end
end
