# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_04_24_162005) do
  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "status", default: 0, null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_date"], name: "index_projects_on_end_date"
    t.index ["start_date"], name: "index_projects_on_start_date"
    t.index ["status"], name: "index_projects_on_status"
  end

  create_table "task_link_types", force: :cascade do |t|
    t.string "name", null: false
    t.string "source_relationship", null: false
    t.string "target_relationship", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_task_link_types_on_name", unique: true
  end

  create_table "task_links", force: :cascade do |t|
    t.integer "source_task_id", null: false
    t.integer "target_task_id", null: false
    t.integer "link_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_type_id"], name: "index_task_links_on_link_type_id"
    t.index ["source_task_id", "target_task_id", "link_type_id"], name: "idx_unique_task_links"
    t.index ["source_task_id", "target_task_id"], name: "idx_source_target_task_links", unique: true
    t.index ["source_task_id"], name: "index_task_links_on_source_task_id"
    t.index ["target_task_id"], name: "index_task_links_on_target_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.text "description"
    t.date "due_date", null: false
    t.integer "status", default: 0, null: false
    t.integer "project_id", null: false
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["completed_at"], name: "index_tasks_on_completed_at"
    t.index ["due_date"], name: "index_tasks_on_due_date"
    t.index ["project_id"], name: "index_tasks_on_project_id"
    t.index ["status"], name: "index_tasks_on_status"
  end

  add_foreign_key "task_links", "task_link_types", column: "link_type_id"
  add_foreign_key "task_links", "tasks", column: "source_task_id"
  add_foreign_key "task_links", "tasks", column: "target_task_id"
  add_foreign_key "tasks", "projects"
end
