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

ActiveRecord::Schema.define(version: 2024_04_19_180207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "number"
    t.string "complement"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_addresses_on_client_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "budgets", force: :cascade do |t|
    t.date "date"
    t.integer "quantity"
    t.decimal "service_value"
    t.boolean "approval"
    t.text "observations"
    t.bigint "client_id"
    t.bigint "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "service_id"
    t.index ["client_id"], name: "index_budgets_on_client_id"
    t.index ["service_id"], name: "index_budgets_on_service_id"
    t.index ["vehicle_id"], name: "index_budgets_on_vehicle_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "observation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_orders", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "vehicle_id"
    t.integer "mileage"
    t.datetime "entry_time"
    t.datetime "exit_time"
    t.date "entry_date"
    t.date "exit_date"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_service_orders_on_client_id"
    t.index ["vehicle_id"], name: "index_service_orders_on_vehicle_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "budget_id"
    t.index ["budget_id"], name: "index_services_on_budget_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "license_plate"
    t.string "brand"
    t.string "model"
    t.bigint "client_id"
    t.string "color"
    t.integer "year_of_manufacture"
    t.string "fuel_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gear"
    t.decimal "engine_size", precision: 10, scale: 2
    t.integer "year_model"
    t.decimal "avg_price_brl", precision: 10, scale: 2
    t.index ["client_id"], name: "index_vehicles_on_client_id"
  end

  add_foreign_key "addresses", "clients"
  add_foreign_key "budgets", "clients"
  add_foreign_key "budgets", "services"
  add_foreign_key "budgets", "vehicles"
  add_foreign_key "service_orders", "clients"
  add_foreign_key "service_orders", "vehicles"
  add_foreign_key "services", "budgets"
  add_foreign_key "vehicles", "clients"
end
