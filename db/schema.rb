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

ActiveRecord::Schema.define(version: 2023_07_07_213155) do

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

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
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

  create_table "candidature_dates", force: :cascade do |t|
    t.bigint "help_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["help_id"], name: "index_candidature_dates_on_help_id"
  end

  create_table "case_reviews", force: :cascade do |t|
    t.string "candidate_email"
    t.string "reviewer_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.text "points_forts"
    t.text "points_faibles"
    t.string "lien_video"
    t.text "autres"
    t.datetime "creation_binome"
    t.datetime "date_notation"
    t.text "message"
    t.boolean "valid_cgu", default: false
    t.datetime "date_envoi_feedback"
    t.boolean "valid_conditions", default: false
    t.boolean "accept_partage_email"
  end

  create_table "chiffres_organizations", force: :cascade do |t|
    t.integer "annee"
    t.integer "nb_femmes_etudiantes"
    t.integer "nb_total_etudiants"
    t.float "etudiants_parite"
    t.integer "nb_femmes_enseignantes"
    t.integer "nb_total_enseignants"
    t.float "enseignants_parite"
    t.integer "nb_femmes_photographes_etudiees"
    t.integer "nb_total_photographes_etudies"
    t.float "photographes_etudies_parite"
    t.integer "nb_femmes_publiees"
    t.integer "nb_total_publies"
    t.float "publies_parite"
    t.integer "nb_femmes_iconographes"
    t.integer "nb_total_iconographes"
    t.float "iconographes_parite"
    t.integer "nb_femmes_exposees"
    t.integer "nb_total_exposes"
    t.float "exposes_parite"
    t.integer "nb_femmes_exposees_expo_collective"
    t.integer "nb_total_exposes_expo_collective"
    t.float "exposes_expo_collective_parite"
    t.integer "nb_femmes_exposees_expo_mono"
    t.integer "nb_total_exposes_expo_mono"
    t.float "exposes_expo_mono_parite"
    t.integer "nb_femmes_moins_40"
    t.integer "nb_femmes_plus_40"
    t.integer "nb_femmes_post_mortem"
    t.integer "nb_femmes_commissaires"
    t.integer "nb_total_commissaires"
    t.float "commissaires_parite"
    t.integer "nb_femmes_artistes"
    t.integer "nb_total_artistes"
    t.float "artistes_parite"
    t.integer "nb_oeuvres_photo_femmes"
    t.integer "nb_total_oeuvres_photo"
    t.float "oeuvres_photo_parite"
    t.integer "nb_femmes_oeuvres_ajoutees"
    t.integer "nb_total_oeuvres_ajoutees"
    t.float "oeuvres_ajoutees_parite"
    t.integer "nb_femmes_candidates"
    t.integer "nb_total_candidats"
    t.float "candidates_parite"
    t.integer "nb_femmes_laureates"
    t.integer "nb_total_laureates"
    t.float "laureates_parite"
    t.integer "nb_femmes_jurys"
    t.integer "nb_total_jurys"
    t.float "jurys_parite"
    t.integer "nb_femmes_accueil_residence"
    t.integer "nb_total_accueil_residence"
    t.float "accueil_residence_parite"
    t.integer "nb_femmes_photo_ouvrages"
    t.integer "nb_total_photo_ouvrages"
    t.float "photo_ouvrages_parite"
    t.integer "nb_femmes_photographes_invites"
    t.integer "nb_total_photographes_invites"
    t.float "photographes_invites_parite"
    t.integer "nb_femmes_directrices"
    t.integer "nb_total_directeurs"
    t.float "directeurs_parite"
    t.integer "nb_femmes_employees"
    t.integer "nb_total_employes"
    t.float "employes_parite"
    t.text "actions_egalite"
    t.bigint "organization_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "visible", default: false
    t.index ["organization_id"], name: "index_chiffres_organizations_on_organization_id"
  end

  create_table "conseils_articles", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.string "objectif"
    t.integer "lecture_time"
    t.text "introduction"
    t.text "explication"
    t.text "citation"
    t.text "a_retenir"
    t.string "auteur"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "citation_auteur"
    t.string "sources"
    t.string "liens_utiles"
  end

  create_table "conseils_videos", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.string "format"
    t.string "objectif"
    t.integer "lecture_time"
    t.text "contenu_explication"
    t.string "protagoniste"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "liens_utiles"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "contact_email"
    t.string "contact_type"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "message"
    t.boolean "accept_cgu", default: false
  end

  create_table "evaluation_helps", force: :cascade do |t|
    t.bigint "help_id", null: false
    t.integer "eval_dossier"
    t.integer "eval_dispositif"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["help_id"], name: "index_evaluation_helps_on_help_id"
  end

  create_table "help_apis", force: :cascade do |t|
    t.integer "api_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "helps", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "institution_name"
    t.string "help_amount"
    t.string "residence_condition"
    t.text "general_condition"
    t.text "specific_condition"
    t.string "candidate_url"
    t.string "institution_url"
    t.text "selection"
    t.string "compo_commission"
    t.string "old_laureat"
    t.text "admin_attachment"
    t.text "contact_institution"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "faq_url"
    t.date "end_date"
    t.date "start_date"
    t.string "description_url"
    t.string "contact_intitution_email"
    t.string "commission_parite"
    t.string "old_laureats_parite"
    t.boolean "visible", default: true
    t.text "description_longue"
    t.boolean "permanent", default: false
    t.boolean "open"
    t.string "author_email"
    t.boolean "suggested", default: false
    t.boolean "from_api", default: false
    t.boolean "accept_cgu", default: false
  end

  create_table "notation_catalogues", force: :cascade do |t|
    t.string "catalogue"
    t.integer "utile", default: 0, null: false
    t.integer "utile_mais_fermee", default: 0, null: false
    t.integer "inutile", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notation_conseils_articles", force: :cascade do |t|
    t.bigint "conseils_article_id"
    t.integer "utile", default: 0, null: false
    t.integer "inutile", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "comment"
    t.text "suggestion"
    t.index ["conseils_article_id"], name: "index_notation_conseils_articles_on_conseils_article_id"
  end

  create_table "notation_conseils_videos", force: :cascade do |t|
    t.bigint "conseils_video_id"
    t.integer "utile", default: 0, null: false
    t.integer "inutile", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "comment"
    t.text "suggestion"
    t.index ["conseils_video_id"], name: "index_notation_conseils_videos_on_conseils_video_id"
  end

  create_table "notation_helps", force: :cascade do |t|
    t.bigint "help_id"
    t.integer "oui", default: 0, null: false
    t.integer "oui_mais_fermee", default: 0, null: false
    t.integer "non", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "comment"
    t.text "suggestion"
    t.index ["help_id"], name: "index_notation_helps_on_help_id"
  end

  create_table "notification_helps", force: :cascade do |t|
    t.string "email"
    t.bigint "help_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "sent", default: false
    t.boolean "accept_cgu", default: false
    t.index ["help_id"], name: "index_notification_helps_on_help_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "organization_type"
    t.string "name"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "visible", default: true
    t.string "titre"
    t.string "email"
    t.boolean "finance_ministre", default: false
    t.boolean "page_structure", default: false
    t.boolean "observatoire_egalite", default: false
    t.bigint "organization_id"
    t.string "website"
    t.string "reseau"
    t.index ["organization_id"], name: "index_organizations_on_organization_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.bigint "help_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["help_id"], name: "index_reviews_on_help_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.string "tenant", limit: 128
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
    t.index ["tenant"], name: "index_taggings_on_tenant"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "webinaires", force: :cascade do |t|
    t.string "titre"
    t.datetime "date"
    t.string "url"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "participant"
    t.string "url_inscription"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "evaluation_helps", "helps"
  add_foreign_key "organizations", "organizations"
  add_foreign_key "reviews", "helps"
  add_foreign_key "taggings", "tags"
end
