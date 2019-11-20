class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :task_name, null: false
      t.text :task_content, null: false
      t.datetime :deadline
      t.integer :priority
      t.string :status
      t.string :task_label

      t.timestamps
    end
  end
end
