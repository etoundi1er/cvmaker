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

ActiveRecord::Schema.define(version: 20180511194741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "certifications", force: :cascade do |t|
    t.string "title"
    t.string "company"
    t.string "location"
    t.string "start_date"
    t.string "end_date"
    t.text "summary"
    t.bigint "cv_template_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_template_id"], name: "index_certifications_on_cv_template_id"
    t.index ["user_id"], name: "index_certifications_on_user_id"
  end

  create_table "cv_templates", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "firstname"
    t.string "lastname"
    t.string "profession"
    t.string "phone"
    t.string "email"
    t.string "website"
    t.text "address"
    t.bigint "image_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_id"], name: "index_cv_templates_on_image_id"
    t.index ["title"], name: "index_cv_templates_on_title"
    t.index ["user_id"], name: "index_cv_templates_on_user_id"
  end

  create_table "educations", force: :cascade do |t|
    t.string "courses"
    t.string "academy"
    t.string "location"
    t.string "start_date"
    t.string "end_date"
    t.text "summary"
    t.bigint "cv_template_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_template_id"], name: "index_educations_on_cv_template_id"
    t.index ["user_id"], name: "index_educations_on_user_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "position"
    t.string "company"
    t.string "location"
    t.string "start_date"
    t.string "end_date"
    t.text "summary"
    t.bigint "cv_template_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_template_id"], name: "index_experiences_on_cv_template_id"
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "title"
    t.string "image"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_images_on_user_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.bigint "cv_template_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_template_id"], name: "index_languages_on_cv_template_id"
    t.index ["user_id"], name: "index_languages_on_user_id"
  end

  create_table "recommendations", force: :cascade do |t|
    t.string "name"
    t.string "job"
    t.string "company"
    t.string "phone"
    t.string "email"
    t.bigint "cv_template_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_template_id"], name: "index_recommendations_on_cv_template_id"
    t.index ["user_id"], name: "index_recommendations_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.bigint "cv_template_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_template_id"], name: "index_skills_on_cv_template_id"
    t.index ["user_id"], name: "index_skills_on_user_id"
  end

  create_table "social_networks", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.bigint "cv_template_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["cv_template_id"], name: "index_social_networks_on_cv_template_id"
    t.index ["user_id"], name: "index_social_networks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
