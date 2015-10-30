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

ActiveRecord::Schema.define(version: 20151029225944) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text     "body",        null: false
    t.integer  "user_id"
    t.integer  "upvotes"
    t.integer  "question_id", null: false
    t.boolean  "selected"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "link_url"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["upvotes"], name: "index_answers_on_upvotes", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "body",        null: false
    t.integer  "upvotes"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "comments", ["answer_id"], name: "index_comments_on_answer_id", using: :btree
  add_index "comments", ["question_id"], name: "index_comments_on_question_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "title",                 null: false
    t.text     "body",                  null: false
    t.integer  "user_id",               null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.boolean  "response_notification"
    t.string   "filepicker_url"
  end

  add_index "questions", ["title"], name: "index_questions_on_title", unique: true, using: :btree
  add_index "questions", ["user_id"], name: "index_questions_on_user_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.integer  "question_id", null: false
    t.string   "category",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tags", ["category"], name: "index_tags_on_category", using: :btree
  add_index "tags", ["question_id"], name: "index_tags_on_question_id", using: :btree

  create_table "upvotes", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "user_id",     null: false
    t.integer  "answer_id"
    t.integer  "comment_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "value"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.integer  "reputation"
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.string   "status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
