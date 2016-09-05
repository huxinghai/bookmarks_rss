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

ActiveRecord::Schema.define(version: 20160905132227) do

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.string   "link"
    t.string   "title",        limit: 300,                  null: false
    t.datetime "published"
    t.string   "author"
    t.text     "description",  limit: 65535
    t.text     "content",      limit: 65535
    t.string   "guid"
    t.boolean  "status",                     default: true
    t.integer  "site_info_id",                              null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["link", "site_info_id"], name: "index_articles_on_link_and_site_info_id", unique: true, using: :btree
  end

  create_table "bookmarks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.string   "provision_id"
    t.string   "parent_id"
    t.integer  "index"
    t.string   "url"
    t.string   "title"
    t.bigint   "date_added"
    t.bigint   "date_group_modified"
    t.integer  "user_id",             null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "site_info_id"
  end

  create_table "delayed_jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.integer  "priority",                 default: 0, null: false
    t.integer  "attempts",                 default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "site_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.string   "url"
    t.string   "title"
    t.string   "fovicon"
    t.datetime "last_updated_at", default: '2016-09-04 12:27:11'
    t.boolean  "status",          default: true
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.index ["url"], name: "index_site_infos_on_url_and_user_id", unique: true, using: :btree
  end

  create_table "site_infos_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.integer "site_info_id"
    t.integer "user_id"
    t.index ["site_info_id", "user_id"], name: "index_site_infos_users_on_site_info_id_and_user_id", unique: true, using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string   "email"
    t.string   "provision_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.bigint   "last_date_added", default: 0
    t.datetime "last_sign_in_at"
    t.datetime "last_read_time"
  end

end
