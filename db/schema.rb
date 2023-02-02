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

ActiveRecord::Schema[7.0].define(version: 20_230_127_221_440) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'profile_data', force: :cascade do |t|
    t.bigint 'profile_id', null: false
    t.bigint 'profile_section_id', null: false
    t.string 'title'
    t.string 'subtitle'
    t.date 'start_date'
    t.date 'end_date'
    t.string 'location'
    t.string 'description'
    t.string 'items'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['profile_id'], name: 'index_profile_data_on_profile_id'
    t.index ['profile_section_id'], name: 'index_profile_data_on_profile_section_id'
  end

  create_table 'profile_sections', force: :cascade do |t|
    t.string 'type'
    t.string 'title'
    t.integer 'priority'
    t.string 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'profiles', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email'
    t.string 'phone'
    t.string 'url'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_profiles_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'profile_data', 'profile_sections'
  add_foreign_key 'profile_data', 'profiles'
  add_foreign_key 'profiles', 'users'
end
