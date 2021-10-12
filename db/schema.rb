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

ActiveRecord::Schema.define(version: 2021_10_12_095455) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "conseils", force: :cascade do |t|
    t.string "title"
    t.string "category", default: [], array: true
    t.string "tags", default: [], array: true
    t.text "introduction"
    t.string "objectif"
    t.string "lecture_time"
    t.text "explication"
    t.text "perspective"
    t.text "citation"
    t.string "video_title"
    t.string "video_time"
    t.text "to_remember"
    t.text "useful_link"
    t.string "en_savoir_plus"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "conseils_articles", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.string "category", default: [], array: true
    t.string "tags", default: [], array: true
    t.string "objectif"
    t.integer "lecture_time"
    t.text "introduction"
    t.text "explication"
    t.text "perspective"
    t.text "citation"
    t.text "a_retenir"
    t.text "liens_utiles", default: [], array: true
    t.string "auteur"
    t.string "sources", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "conseils_videos", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.string "category", default: [], array: true
    t.string "tags", default: [], array: true
    t.string "format"
    t.string "objectif"
    t.integer "lecture_time"
    t.text "contenu_explication"
    t.text "liens_utiles", default: [], array: true
    t.string "protagoniste"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "contact_email"
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
    t.string "institution_name"
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
    t.text "admin_attachment"
    t.text "artistic_attachment"
    t.text "other_attachment"
    t.text "contact_institution"
    t.string "contact_institution_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "example_enrollment_url"
    t.string "faq_url"
    t.string "issue_contact"
    t.text "statistic"
    t.date "end_date"
    t.date "start_date"
    t.string "identifiant"
    t.string "institution_partenaire"
    t.string "regularity"
    t.string "description_url"
    t.string "residence_time"
    t.string "help_advantage"
    t.string "old_laureats_case_url"
    t.string "parentality"
    t.string "accessibility"
    t.string "contact_intitution_email", default: [], array: true
    t.string "contact_intitution_partenaire", default: [], array: true
    t.string "help_type", default: [], array: true
  end

end
