# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2019_11_26_100904) do
=======
ActiveRecord::Schema.define(version: 2019_11_21_085800) do
>>>>>>> fdc782a889bcc2b0f87b8b9c7c0506b14e0c2cc4

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tasks", force: :cascade do |t|
    t.string "task_name", null: false
    t.text "task_content", null: false
<<<<<<< HEAD
=======

>>>>>>> fdc782a889bcc2b0f87b8b9c7c0506b14e0c2cc4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deadline"
    t.integer "priority"
    t.string "status"
    t.string "task_label"
<<<<<<< HEAD
    t.bigint "user_id"
=======
    t.index ["task_name"], name: "index_tasks_on_task_name"
>>>>>>> fdc782a889bcc2b0f87b8b9c7c0506b14e0c2cc4
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "tasks", "users"
end
