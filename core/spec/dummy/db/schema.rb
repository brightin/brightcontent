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

ActiveRecord::Schema.define(version: 2016_06_23_142310) do

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blogs", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "featured"
    t.integer "author_id"
    t.boolean "active", default: true
  end

  create_table "brightcontent_admin_users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.text "text"
    t.integer "blog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["blog_id"], name: "index_comments_on_blog_id"
  end

  create_table "grouped_blogs", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.boolean "active", default: true
    t.integer "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
