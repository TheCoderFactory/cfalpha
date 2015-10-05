# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151004173559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_bookings", force: :cascade do |t|
    t.integer  "course_intake_id"
    t.integer  "user_id"
    t.decimal  "price"
    t.string   "promo_code"
    t.boolean  "paid"
    t.boolean  "completed"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "guid"
    t.decimal  "gst"
    t.decimal  "discount"
    t.boolean  "reminder_send",    default: false
  end

  add_index "course_bookings", ["course_intake_id"], name: "index_course_bookings_on_course_intake_id", using: :btree
  add_index "course_bookings", ["guid"], name: "index_course_bookings_on_guid", unique: true, using: :btree
  add_index "course_bookings", ["user_id"], name: "index_course_bookings_on_user_id", using: :btree

  create_table "course_intakes", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "course_location_id"
    t.date     "start_date"
    t.time     "start_time"
    t.date     "end_date"
    t.time     "end_time"
    t.string   "days_of_week"
    t.string   "status"
    t.decimal  "price"
    t.string   "slug"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "course_intakes", ["course_id"], name: "index_course_intakes_on_course_id", using: :btree
  add_index "course_intakes", ["course_location_id"], name: "index_course_intakes_on_course_location_id", using: :btree

  create_table "course_locations", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "address_one"
    t.string   "address_two"
    t.string   "suburb"
    t.string   "state"
    t.string   "postcode"
    t.string   "country"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "course_skills", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "course_skills", ["course_id"], name: "index_course_skills_on_course_id", using: :btree
  add_index "course_skills", ["skill_id"], name: "index_course_skills_on_skill_id", using: :btree

  create_table "course_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "courses", force: :cascade do |t|
    t.integer  "course_type_id"
    t.string   "name"
    t.string   "tagline"
    t.text     "description"
    t.boolean  "active"
    t.string   "slug"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "icon"
    t.string   "color"
  end

  add_index "courses", ["course_type_id"], name: "index_courses_on_course_type_id", using: :btree

  create_table "enquiries", force: :cascade do |t|
    t.integer  "enquiry_type_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "phone"
    t.string   "email"
    t.text     "message"
    t.boolean  "responded_to"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "enquiries", ["enquiry_type_id"], name: "index_enquiries_on_enquiry_type_id", using: :btree
  add_index "enquiries", ["user_id"], name: "index_enquiries_on_user_id", using: :btree

  create_table "enquiry_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "code"
    t.boolean  "important",   default: false
  end

  create_table "feedback_forms", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "course_location_id"
    t.integer  "expectations"
    t.integer  "recommend"
    t.integer  "another"
    t.integer  "satisfaction"
    t.integer  "value"
    t.text     "best_part"
    t.text     "comments"
    t.text     "testimonial"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "feedback_forms", ["course_id"], name: "index_feedback_forms_on_course_id", using: :btree
  add_index "feedback_forms", ["course_location_id"], name: "index_feedback_forms_on_course_location_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "payments", force: :cascade do |t|
    t.integer  "course_booking_id"
    t.decimal  "amount"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "payments", ["course_booking_id"], name: "index_payments_on_course_booking_id", using: :btree

  create_table "post_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "icon"
    t.integer  "post_count"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_category_id"
    t.string   "impressions_count"
    t.string   "title"
    t.text     "lead"
    t.text     "content"
    t.string   "image"
    t.string   "slug"
    t.boolean  "publish"
    t.date     "published_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "posts", ["post_category_id"], name: "index_posts_on_post_category_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "prequestionnaires", force: :cascade do |t|
    t.integer  "course_booking_id"
    t.string   "reason"
    t.string   "background"
    t.string   "experience"
    t.string   "hobbies"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "prequestionnaires", ["course_booking_id"], name: "index_prequestionnaires_on_course_booking_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "picture"
    t.string   "phone"
    t.string   "github"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "gender"
    t.string   "age"
    t.string   "referral"
    t.string   "referral_other"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "promo_codes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price_value"
    t.integer  "percent_value"
    t.datetime "expiry_date"
    t.integer  "user_id"
    t.string   "code"
    t.integer  "course_intake_id"
    t.integer  "creator_id"
    t.date     "date_used"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.decimal  "discount"
  end

  add_index "promo_codes", ["course_intake_id"], name: "index_promo_codes_on_course_intake_id", using: :btree
  add_index "promo_codes", ["user_id"], name: "index_promo_codes_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "skill_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "skills", force: :cascade do |t|
    t.integer  "skill_category_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "active"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "skills", ["skill_category_id"], name: "index_skills_on_skill_category_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "posts", "post_categories"
  add_foreign_key "posts", "users"
end
