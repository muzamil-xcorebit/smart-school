# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_06_28_083231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "child_pods", force: :cascade do |t|
    t.integer "status", default: 1
    t.bigint "child_id", null: false
    t.bigint "pod_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["child_id"], name: "index_child_pods_on_child_id"
    t.index ["pod_id"], name: "index_child_pods_on_pod_id"
  end

  create_table "children", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.bigint "parent_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_children_on_parent_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pods", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "review"
    t.bigint "pod_id", null: false
    t.bigint "parent_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_reviews_on_parent_id"
    t.index ["pod_id"], name: "index_reviews_on_pod_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.bigint "pod_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pod_id"], name: "index_teachers_on_pod_id"
  end

  add_foreign_key "child_pods", "children"
  add_foreign_key "child_pods", "pods"
  add_foreign_key "children", "parents"
  add_foreign_key "reviews", "parents"
  add_foreign_key "reviews", "pods"
  add_foreign_key "teachers", "pods"
end
