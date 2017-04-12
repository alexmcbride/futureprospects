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

ActiveRecord::Schema.define(version: 20170412095242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.integer  "student_id"
    t.string   "title"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "family_name"
    t.string   "previous_name"
    t.integer  "gender"
    t.string   "telephone"
    t.string   "mobile"
    t.string   "email"
    t.string   "disability"
    t.text     "personal_statement"
    t.string   "permanent_house_number"
    t.string   "permanent_address_1"
    t.string   "permanent_address_2"
    t.string   "permanent_postcode"
    t.string   "permanent_country"
    t.string   "correspondence_house_number"
    t.string   "correspondence_address_1"
    t.string   "correspondence_address_2"
    t.string   "correspondence_postcode"
    t.string   "correspondence_country"
    t.integer  "state"
    t.datetime "submitted_date"
    t.decimal  "payment_amount",              precision: 4, scale: 2
    t.integer  "payment_type"
    t.datetime "payment_date"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "scottish_candidate_number"
    t.string   "national_insurance_number"
    t.boolean  "completed_intro"
    t.boolean  "completed_profile"
    t.boolean  "completed_education"
    t.boolean  "completed_employment"
    t.boolean  "completed_references"
    t.boolean  "completed_statement"
    t.boolean  "completed_courses"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", using: :btree
  end

  create_table "colleges", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "address"
    t.string   "postcode"
    t.string   "telephone"
    t.string   "email"
    t.string   "website"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
    t.index ["name"], name: "index_colleges_on_name", using: :btree
  end

  create_table "course_selections", force: :cascade do |t|
    t.integer  "application_id"
    t.integer  "course_id"
    t.integer  "college_offer"
    t.integer  "student_choice"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["application_id", "course_id"], name: "index_course_selections_on_application_id_and_course_id", unique: true, using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "entry_requirements"
    t.text     "career_prospects"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "level"
    t.integer  "college_id"
    t.integer  "category_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image"
    t.integer  "spaces"
    t.index ["title"], name: "index_courses_on_title", using: :btree
  end

  create_table "jobs", force: :cascade do |t|
    t.integer  "application_id"
    t.string   "employer"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "postcode"
    t.string   "country"
    t.string   "job_title"
    t.string   "duties"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "qualifications", force: :cascade do |t|
    t.integer  "school_id"
    t.string   "subject"
    t.string   "award"
    t.string   "grade"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "references", force: :cascade do |t|
    t.integer  "application_id"
    t.string   "reference_1_full_name"
    t.string   "reference_1_occupation"
    t.string   "reference_1_relationship"
    t.string   "reference_1_address_1"
    t.string   "reference_1_address_2"
    t.string   "reference_1_country"
    t.string   "reference_1_postcode"
    t.string   "reference_1_telephone"
    t.string   "reference_1_email"
    t.string   "reference_2_full_name"
    t.string   "reference_2_occupation"
    t.string   "reference_2_relationship"
    t.string   "reference_2_address_1"
    t.string   "reference_2_address_2"
    t.string   "reference_2_country"
    t.string   "reference_2_postcode"
    t.string   "reference_2_telephone"
    t.string   "reference_2_email"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "schools", force: :cascade do |t|
    t.integer  "application_id"
    t.string   "name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "postcode"
    t.string   "country"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                     default: "", null: false
    t.string   "encrypted_password",        default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",           default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "type"
    t.string   "first_name"
    t.string   "family_name"
    t.string   "username"
    t.string   "scottish_candidate_number"
    t.string   "national_insurance_number"
    t.integer  "college_id"
    t.string   "job_title"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
  end

end
