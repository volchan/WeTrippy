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

ActiveRecord::Schema.define(version: 20170829113033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exp_languages", force: :cascade do |t|
    t.bigint "experience_id"
    t.bigint "language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experience_id"], name: "index_exp_languages_on_experience_id"
    t.index ["language_id"], name: "index_exp_languages_on_language_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.integer "host_id"
    t.bigint "category_id"
    t.boolean "solidary"
    t.integer "slots"
    t.string "address"
    t.float "lat"
    t.float "long"
    t.string "title"
    t.text "description"
    t.integer "type"
    t.string "slogan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_experiences_on_category_id"
  end

  create_table "languages", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
  end

  create_table "steps", force: :cascade do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.bigint "experience_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experience_id"], name: "index_steps_on_experience_id"
  end

  create_table "user_languages", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_user_languages_on_language_id"
    t.index ["user_id"], name: "index_user_languages_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.integer "country_id"
    t.string "phone"
    t.text "description"
    t.string "address"
    t.integer "sex"
    t.text "hobbies"
    t.integer "privileges"
    t.index ["country_id"], name: "index_users_on_country_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "exp_languages", "experiences"
  add_foreign_key "exp_languages", "languages"
  add_foreign_key "experiences", "categories"
  add_foreign_key "steps", "experiences"
  add_foreign_key "user_languages", "languages"
  add_foreign_key "user_languages", "users"
  add_foreign_key "users", "countries"
end
