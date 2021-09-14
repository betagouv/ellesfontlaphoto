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

ActiveRecord::Schema.define(version: 2021_09_13_150842) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "email"
    t.string "contact_type"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "message"
  end

  create_table "helps", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "sector"
    t.string "structure_name"
    t.string "start_month"
    t.string "end_month"
    t.string "help_amount"
    t.string "residence_condition"
    t.string "general_condition"
    t.text "specific_condition"
    t.string "candidate_url"
    t.string "institution_url"
    t.text "selection"
    t.string "compo_commission"
    t.string "url_commission"
    t.string "old_laureat"
    t.string "old_laureat_url"
    t.string "help_type"
    t.text "admin_attachment"
    t.text "artistic_attachment"
    t.text "other_attachment"
    t.text "contact_institution"
    t.string "contact_institution_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
