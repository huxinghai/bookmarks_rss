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

ActiveRecord::Schema.define(version: 20160831140536) do

  create_table "articles", force: :cascade do |t|
    t.string   "link"
    t.string   "title",        limit: 300,                null: false
    t.datetime "published"
    t.string   "author"
    t.text     "description"
    t.text     "content"
    t.string   "guid"
    t.integer  "user_id",                                 null: false
    t.boolean  "status",                   default: true
    t.integer  "site_info_id",                            null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["title", "site_info_id"], name: "index_articles_on_title_and_site_info_id", unique: true
  end

  create_table "bookmarks", force: :cascade do |t|
    t.string   "provision_id"
    t.string   "parent_id"
    t.integer  "index"
    t.string   "url"
    t.string   "title"
    t.integer  "date_added",          limit: 8
    t.integer  "date_group_modified", limit: 8
    t.integer  "user_id",                       null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "site_info_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "site_infos", force: :cascade do |t|
    t.string   "url"
    t.string   "title"
    t.string   "fovicon"
    t.datetime "last_updated_at", default: '2016-08-30 14:11:18'
    t.integer  "user_id"
    t.boolean  "status",          default: true
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.index ["url", "user_id"], name: "index_site_infos_on_url_and_user_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "provision_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "last_date_added", limit: 8, default: 0
    t.datetime "last_sign_in_at"
  end

end
