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

ActiveRecord::Schema[7.0].define(version: 2023_06_16_081602) do
  create_table "conferences", force: :cascade do |t|
    t.string "reference_number"
    t.string "ministry_in_charge"
    t.string "number"
    t.string "email"
    t.string "location"
    t.string "time"
    t.string "date"
    t.string "image"
    t.string "title"
    t.string "description"
    t.string "city"
    t.string "issues"
    t.string "resolutions"
    t.string "recommendations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participants", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "id_number"
    t.string "address"
    t.string "city"
    t.string "nationality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participations", force: :cascade do |t|
    t.integer "participant_id"
    t.integer "conference_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.boolean "is_admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
