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

ActiveRecord::Schema.define(version: 20170720174041) do

  create_table "floristry_form_tasks", force: :cascade do |t|
    t.string   "__feid__"
    t.text     "__msg__"
    t.string   "current_state"
    t.text     "free_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "floristry_trails", force: :cascade do |t|
    t.string   "wfid"
    t.string   "name"
    t.string   "version"
    t.text     "tree"
    t.datetime "launched_at"
    t.datetime "terminated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "archive",       default: false
    t.string   "current_state"
  end

  create_table "flows", force: :cascade do |t|
    t.string   "name"
    t.text     "definition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
