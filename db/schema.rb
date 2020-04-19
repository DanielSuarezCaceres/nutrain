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

ActiveRecord::Schema.define(version: 2020_03_18_211529) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "professional_id"
    t.string "title"
    t.string "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_appointments_on_client_id"
    t.index ["professional_id"], name: "index_appointments_on_professional_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "email"
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "professional_id"
    t.string "state"
    t.string "message"
    t.bigint "sent_by_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_contracts_on_client_id"
    t.index ["professional_id"], name: "index_contracts_on_professional_id"
    t.index ["sent_by_id"], name: "index_contracts_on_sent_by_id"
  end

  create_table "diets", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "kcal_goal"
    t.integer "protein_goal"
    t.integer "carbs_goal"
    t.integer "fats_goal"
    t.integer "total_meals"
    t.bigint "user_id"
    t.string "goal"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_diets_on_user_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "sets"
    t.integer "reps"
    t.integer "weight"
    t.string "file"
    t.bigint "workout_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["workout_id"], name: "index_exercises_on_workout_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.integer "kcal"
    t.float "protein"
    t.float "carbs"
    t.float "fats"
    t.float "serving_size"
    t.boolean "vegan", default: false, null: false
    t.boolean "vegetarian", default: false, null: false
    t.boolean "gluten_free", default: false, null: false
    t.boolean "nut_free", default: false, null: false
    t.boolean "soy_free", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "meal_id", null: false
    t.index ["meal_id"], name: "index_foods_on_meal_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "file"
    t.bigint "user_id"
    t.integer "kcal"
    t.integer "protein"
    t.integer "carbs"
    t.integer "fats"
    t.boolean "vegan", default: false, null: false
    t.boolean "vegetarian", default: false, null: false
    t.boolean "gluten_free", default: false, null: false
    t.boolean "nut_free", default: false, null: false
    t.boolean "soy_free", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "routines", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id"
    t.string "file"
    t.integer "days_of_exercise"
    t.string "goal"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_routines_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "gender"
    t.string "age"
    t.string "height"
    t.string "weight"
    t.string "phone"
    t.string "city"
    t.string "country"
    t.string "description"
    t.string "type"
    t.boolean "nutritionist"
    t.boolean "trainer"
    t.boolean "physiotherapist"
    t.boolean "psychologist"
    t.boolean "verified"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id"
    t.integer "number_of_exercises"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "appointments", "users", column: "client_id"
  add_foreign_key "appointments", "users", column: "professional_id"
  add_foreign_key "contracts", "users", column: "client_id"
  add_foreign_key "contracts", "users", column: "professional_id"
  add_foreign_key "contracts", "users", column: "sent_by_id"
  add_foreign_key "exercises", "workouts"
  add_foreign_key "foods", "meals"
end
