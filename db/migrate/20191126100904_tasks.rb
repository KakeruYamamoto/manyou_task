class Tasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string "task_name", null: false
      t.text "task_content", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.datetime "deadline"
      t.integer "priority"
      t.string "status"
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
