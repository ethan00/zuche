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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130617012556) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "companies", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "link"
    t.boolean  "advan"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pinches", :force => true do |t|
    t.string   "title"
    t.string   "go_time"
    t.text     "body"
    t.string   "way"
    t.string   "car_info"
    t.string   "car_level"
    t.boolean  "is_checked",   :default => false
    t.string   "contact"
    t.string   "tel"
    t.string   "dep_province"
    t.string   "dep_city"
    t.string   "dep_county"
    t.string   "dep_desc"
    t.string   "des_province"
    t.string   "des_city"
    t.string   "des_county"
    t.string   "des_desc"
    t.integer  "person"
    t.integer  "user_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "set_top",      :default => 999
  end

  add_index "pinches", ["car_info"], :name => "index_pinches_on_car_info"
  add_index "pinches", ["car_level"], :name => "index_pinches_on_car_level"
  add_index "pinches", ["dep_city"], :name => "index_pinches_on_dep_city"
  add_index "pinches", ["dep_county"], :name => "index_pinches_on_dep_county"
  add_index "pinches", ["dep_province"], :name => "index_pinches_on_dep_province"
  add_index "pinches", ["des_city"], :name => "index_pinches_on_des_city"
  add_index "pinches", ["des_county"], :name => "index_pinches_on_des_county"
  add_index "pinches", ["des_province"], :name => "index_pinches_on_des_province"
  add_index "pinches", ["is_checked"], :name => "index_pinches_on_is_checked"
  add_index "pinches", ["set_top"], :name => "index_pinches_on_set_top"
  add_index "pinches", ["user_id"], :name => "index_pinches_on_user_id"

  create_table "qiupins", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "go_time"
    t.string   "dep_province"
    t.string   "dep_city"
    t.string   "dep_county"
    t.string   "dep_desc"
    t.string   "des_province"
    t.string   "des_city"
    t.string   "des_county"
    t.string   "des_desc"
    t.integer  "user_id"
    t.boolean  "is_checked",   :default => false
    t.string   "tel"
    t.string   "contact"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "qiupins", ["dep_city"], :name => "index_qiupins_on_dep_city"
  add_index "qiupins", ["dep_county"], :name => "index_qiupins_on_dep_county"
  add_index "qiupins", ["dep_province"], :name => "index_qiupins_on_dep_province"
  add_index "qiupins", ["des_city"], :name => "index_qiupins_on_des_city"
  add_index "qiupins", ["des_county"], :name => "index_qiupins_on_des_county"
  add_index "qiupins", ["des_province"], :name => "index_qiupins_on_des_province"
  add_index "qiupins", ["is_checked"], :name => "index_qiupins_on_is_checked"
  add_index "qiupins", ["user_id"], :name => "index_qiupins_on_user_id"

  create_table "rents", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "style"
    t.string   "tel"
    t.string   "contact"
    t.integer  "price"
    t.string   "car_info"
    t.string   "departure"
    t.boolean  "is_checked", :default => false
    t.integer  "user_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "rents", ["is_checked"], :name => "index_rents_on_is_checked"
  add_index "rents", ["user_id"], :name => "index_rents_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
