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

ActiveRecord::Schema.define(version: 2018_10_09_231056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "badges", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "camp_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "camp_category_groupings", force: :cascade do |t|
    t.bigint "camp_category_id"
    t.bigint "camp_category_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camp_category_group_id"], name: "index_camp_category_groupings_on_camp_category_group_id"
    t.index ["camp_category_id"], name: "index_camp_category_groupings_on_camp_category_id"
  end

  create_table "camp_category_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "camp_shifts", force: :cascade do |t|
    t.date "start"
    t.date "finish"
    t.integer "price"
    t.text "program"
    t.bigint "camp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camp_id"], name: "index_camp_shifts_on_camp_id"
  end

  create_table "camps", force: :cascade do |t|
    t.string "url"
    t.string "name"
    t.string "facebook"
    t.string "vk"
    t.string "incamp_url"
    t.string "ml_url"
    t.string "dt_url"
    t.string "bc_url"
    t.string "pd_url"
    t.string "inlearno_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.text "preview"
    t.text "program"
    t.text "study"
    t.text "accommodation"
    t.text "meal"
    t.text "security"
    t.text "pricing"
    t.text "adds"
    t.string "latitude"
    t.string "longitude"
    t.integer "starting_age"
    t.integer "finish_age"
    t.integer "foundation_year"
    t.integer "kids_in_camp"
    t.integer "kids_in_group"
    t.integer "leaders_per_group"
    t.boolean "promo_day"
    t.integer "photos"
    t.text "video_links"
    t.text "comment"
    t.string "edition"
    t.text "schedule"
    t.bigint "user_id"
    t.boolean "is_finished"
    t.boolean "presentation"
    t.string "group_leader_anounce"
    t.string "admin_comment"
    t.boolean "is_approved"
    t.boolean "has_incamp_price"
    t.bigint "iteration_id"
    t.integer "version_number", default: 0
    t.boolean "is_rated_for_finishing"
    t.boolean "is_rated_for_approving"
    t.float "pay_coefficient"
    t.index ["company_id"], name: "index_camps_on_company_id"
    t.index ["iteration_id"], name: "index_camps_on_iteration_id"
    t.index ["user_id"], name: "index_camps_on_user_id"
  end

  create_table "categorizations", force: :cascade do |t|
    t.bigint "camp_category_id"
    t.bigint "camp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camp_category_id"], name: "index_categorizations_on_camp_category_id"
    t.index ["camp_id"], name: "index_categorizations_on_camp_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "entity"
  end

  create_table "geotags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_leaders", force: :cascade do |t|
    t.string "name"
    t.text "role"
    t.text "about"
    t.bigint "camp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camp_id"], name: "index_group_leaders_on_camp_id"
  end

  create_table "iterations", force: :cascade do |t|
    t.string "text"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rating_change_types", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "change"
  end

  create_table "rating_changes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "rating_change_type_id"
    t.string "comment"
    t.integer "camp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rating_change_type_id"], name: "index_rating_changes_on_rating_change_type_id"
    t.index ["user_id"], name: "index_rating_changes_on_user_id"
  end

  create_table "review_roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "review_text"
    t.string "name"
    t.boolean "is_negative"
    t.bigint "review_role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "camp_id"
    t.index ["camp_id"], name: "index_reviews_on_camp_id"
    t.index ["review_role_id"], name: "index_reviews_on_review_role_id"
  end

  create_table "season_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasonships", force: :cascade do |t|
    t.bigint "camp_id"
    t.bigint "season_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camp_id"], name: "index_seasonships_on_camp_id"
    t.index ["season_type_id"], name: "index_seasonships_on_season_type_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.bigint "badge_id"
    t.string "name"
    t.float "pay_coefficient"
    t.integer "length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "prev_status_id"
    t.integer "next_status_id"
    t.integer "whole_length"
    t.integer "number"
    t.index ["badge_id"], name: "index_statuses_on_badge_id"
  end

  create_table "taggizations", force: :cascade do |t|
    t.bigint "camp_id"
    t.bigint "geotag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camp_id"], name: "index_taggizations_on_camp_id"
    t.index ["geotag_id"], name: "index_taggizations_on_geotag_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.bigint "user_role_id"
    t.bigint "status_id"
    t.integer "rating"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["status_id"], name: "index_users_on_status_id"
    t.index ["user_role_id"], name: "index_users_on_user_role_id"
  end

  create_table "week_results", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "camp_id"
    t.boolean "is_finished"
    t.boolean "is_approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "day"
    t.index ["camp_id"], name: "index_week_results_on_camp_id"
    t.index ["user_id"], name: "index_week_results_on_user_id"
  end

  add_foreign_key "camps", "iterations"
  add_foreign_key "rating_changes", "rating_change_types"
  add_foreign_key "rating_changes", "users"
  add_foreign_key "taggizations", "camps"
  add_foreign_key "taggizations", "geotags"
  add_foreign_key "users", "statuses"
  add_foreign_key "week_results", "camps"
  add_foreign_key "week_results", "users"
end
