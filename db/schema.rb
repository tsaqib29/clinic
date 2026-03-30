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

ActiveRecord::Schema[8.1].define(version: 2026_03_26_075441) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "appointments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.string "note"
    t.bigint "patient_id", null: false
    t.date "scheduled_date"
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "diseases", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.integer "amount"
    t.datetime "created_at", null: false
    t.date "date"
    t.string "description"
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.text "address"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.text "keluhan"
    t.string "name"
    t.string "phone"
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "amount"
    t.datetime "created_at", null: false
    t.date "date"
    t.string "disease"
    t.string "patient_name"
    t.datetime "updated_at", null: false
  end

  create_table "visits", force: :cascade do |t|
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.date "next_visit_date"
    t.bigint "patient_id"
    t.datetime "updated_at", null: false
    t.date "visit_date"
    t.time "visit_time"
    t.index ["patient_id"], name: "index_visits_on_patient_id"
  end

  add_foreign_key "appointments", "patients"
  add_foreign_key "visits", "patients"
end
