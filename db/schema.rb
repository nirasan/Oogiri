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

ActiveRecord::Schema.define(version: 20150703130615) do

  create_table "answers", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "question_id", limit: 4
    t.text     "body",        limit: 65535
    t.string   "category",    limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "sum_of_rate", limit: 4
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "answer_id",  limit: 4
    t.text     "body",       limit: 65535
    t.integer  "rate",       limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "comments", ["answer_id"], name: "index_comments_on_answer_id", using: :btree
  add_index "comments", ["user_id", "answer_id"], name: "index_comments_on_user_id_and_answer_id", unique: true, using: :btree

  create_table "favorites", force: :cascade do |t|
    t.integer  "from_user_id", limit: 4, null: false
    t.integer  "to_user_id",   limit: 4, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "favorites", ["from_user_id", "to_user_id"], name: "index_favorites_on_from_user_id_and_to_user_id", unique: true, using: :btree
  add_index "favorites", ["to_user_id"], name: "index_favorites_on_to_user_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.integer "question_id",   limit: 4
    t.string  "style",         limit: 255
    t.binary  "file_contents", limit: 65535
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.string   "title",              limit: 255
    t.string   "category",           limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "questions", ["user_id"], name: "index_questions_on_user_id", using: :btree

  create_table "rankings", force: :cascade do |t|
    t.integer  "answer_id",  limit: 4
    t.integer  "rank",       limit: 4
    t.integer  "rate",       limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "rankings", ["answer_id"], name: "index_rankings_on_answer_id", using: :btree

  create_table "user_rankings", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "rank",       limit: 4
    t.integer  "rate",       limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_rankings", ["user_id"], name: "index_user_rankings_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255, default: "", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "comments", "answers"
  add_foreign_key "comments", "users"
  add_foreign_key "rankings", "answers"
  add_foreign_key "user_rankings", "users"
end
