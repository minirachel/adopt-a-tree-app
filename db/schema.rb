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

ActiveRecord::Schema.define(version: 2021_06_18_180459) do

  create_table "journals", force: :cascade do |t|
    t.date "journal_time"
    t.string "activities"
    t.date "date_watered"
    t.string "health_rating"
    t.string "litter_rating"
    t.string "notes"
    t.integer "tree_id"
    t.integer "user_id"
  end

  create_table "trees", force: :cascade do |t|
    t.string "nickname"
    t.string "image"
    t.string "tree_map_no"
    t.string "species"
    t.integer "user_id"
    t.integer "journal_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

end
