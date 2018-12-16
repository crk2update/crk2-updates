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

ActiveRecord::Schema.define(version: 20161223075059) do

  create_table "children", force: true do |t|
    t.string   "code"
    t.integer  "family_id"
    t.text     "notes"
    t.string   "given_name1"
    t.string   "given_name2"
    t.string   "family_name1"
    t.string   "family_name2"
    t.string   "preferred_name"
    t.date     "dob"
    t.string   "status"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "derived_community"
    t.integer  "derived_number"
  end

  add_index "children", ["code"], name: "index_children_on_code", unique: true

  create_table "communities", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrollments", force: true do |t|
    t.string   "school_year"
    t.integer  "child_id"
    t.string   "child_code"
    t.integer  "sponsor_id"
    t.string   "sponsor_code"
    t.string   "newyear_shirt_size"
    t.string   "newyear_pant_size"
    t.string   "newyear_shoe_size"
    t.string   "midyear_shirt_size"
    t.string   "midyear_pant_size"
    t.string   "midyear_shoe_size"
    t.integer  "newyear_attendance_id"
    t.text     "newyear_attendance_notes"
    t.integer  "midyear_attendance_id"
    t.text     "midyear_attendance_notes"
    t.boolean  "report_card"
    t.text     "report_notes"
    t.boolean  "work_form"
    t.text     "work_form_notes"
    t.boolean  "pass"
    t.text     "pass_notes"
    t.string   "grades"
    t.text     "grades_notes"
    t.boolean  "letter"
    t.boolean  "not_included"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "newyear_attendance"
    t.string   "midyear_attendance"
    t.string   "close_up_photo"
    t.string   "full_photo"
    t.text     "notes"
    t.text     "newyear_grade"
    t.text     "midyear_grade"
    t.boolean  "midyear_report_card"
    t.boolean  "midyear_work_form"
    t.boolean  "included"
  end

  create_table "families", force: true do |t|
    t.integer  "community_id"
    t.string   "community_code"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "family_years", force: true do |t|
    t.integer  "community_id"
    t.integer  "family_id"
    t.string   "school_year"
    t.string   "picture"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guardians", force: true do |t|
    t.integer  "family_id"
    t.string   "relationship"
    t.integer  "relationship_id"
    t.boolean  "active"
    t.boolean  "primary"
    t.string   "given_name1"
    t.string   "given_name2"
    t.string   "family_name1"
    t.string   "family_name2"
    t.string   "preferred_name"
    t.string   "primary_phone"
    t.string   "secondary_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sponsors", force: true do |t|
    t.string   "code"
    t.string   "donor_number"
    t.string   "given_name"
    t.string   "family_name"
    t.string   "link"
    t.string   "street_address"
    t.string   "city"
    t.string   "postal_code"
    t.string   "primary_email"
    t.string   "secondary_email"
    t.string   "primary_phone"
    t.string   "secondary_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sponsorships", force: true do |t|
    t.string   "school_year"
    t.integer  "sponsor_id"
    t.string   "sponsor_code"
    t.integer  "number_children"
    t.integer  "dollar_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "role"
    t.string   "hashed_password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
