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

ActiveRecord::Schema[7.2].define(version: 2017_08_15_235254) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guests", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "guest_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_guests_on_user_id"
  end

  create_table "hosts", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "host_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_hosts_on_user_id"
  end

  create_table "photos", id: :serial, force: :cascade do |t|
    t.integer "room_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "aimage_file_name"
    t.integer "image_file_size"
    t.string "image_content_type"
    t.datetime "image_updated_at", precision: nil
    t.index ["room_id"], name: "index_photos_on_room_id"
  end

  create_table "reservations", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "room_id"
    t.datetime "start_date", precision: nil
    t.datetime "end_date", precision: nil
    t.integer "price"
    t.integer "total"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["room_id"], name: "index_reservations_on_room_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "reviews", id: :serial, force: :cascade do |t|
    t.text "comment"
    t.integer "star", default: 1
    t.integer "room_id"
    t.integer "reservation_id"
    t.integer "guest_id"
    t.integer "host_id"
    t.string "type"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["guest_id"], name: "index_reviews_on_guest_id"
    t.index ["host_id"], name: "index_reviews_on_host_id"
    t.index ["reservation_id"], name: "index_reviews_on_reservation_id"
    t.index ["room_id"], name: "index_reviews_on_room_id"
  end

  create_table "rooms", id: :serial, force: :cascade do |t|
    t.string "home_type"
    t.string "room_type"
    t.integer "accommodate"
    t.integer "bed_room"
    t.integer "bath_room"
    t.string "listing_name"
    t.text "summary"
    t.string "address"
    t.boolean "is_tv"
    t.boolean "is_kitchen"
    t.boolean "is_air"
    t.boolean "is_heating"
    t.boolean "is_internet"
    t.integer "price"
    t.boolean "active"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: nil
    t.datetime "confirmation_sent_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "fullname"
    t.string "provider"
    t.string "uid"
    t.string "image"
    t.string "phone_number"
    t.text "description"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "guests", "users"
  add_foreign_key "hosts", "users"
  add_foreign_key "photos", "rooms"
  add_foreign_key "reservations", "rooms"
  add_foreign_key "reservations", "users"
  add_foreign_key "reviews", "guests"
  add_foreign_key "reviews", "hosts"
  add_foreign_key "reviews", "reservations"
  add_foreign_key "reviews", "rooms"
  add_foreign_key "rooms", "users"
end
