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
ActiveRecord::Schema.define(version: 20181109011641) do
=======
ActiveRecord::Schema.define(version: 20181107201324) do
>>>>>>> f356eae0d7ad0ef6aefc04aa696a01c0b5f21bfc

  create_table "assistants", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.boolean "pay_entry"
    t.boolean "auth_delivered"
    t.boolean "auth_revised"
    t.boolean "paid_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.date "date"
    t.text "location"
    t.text "address"
    t.float "price_ti"
    t.float "price_bus"
    t.text "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "email"
<<<<<<< HEAD
=======
    t.text "password"
>>>>>>> f356eae0d7ad0ef6aefc04aa696a01c0b5f21bfc
    t.text "phone"
    t.date "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
<<<<<<< HEAD
    t.string "password_digest"
    t.string "auth_tokens"
=======
>>>>>>> f356eae0d7ad0ef6aefc04aa696a01c0b5f21bfc
  end

end
