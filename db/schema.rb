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

ActiveRecord::Schema[7.0].define(version: 2023_08_25_015125) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "photo"
    t.string "description"
    t.datetime "when_went"
    t.bigint "aventure_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aventure_id"], name: "index_articles_on_aventure_id"
  end

  create_table "aventures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "catcomments", force: :cascade do |t|
    t.string "content"
    t.bigint "article_id", null: false
    t.bigint "catuser_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_catcomments_on_article_id"
    t.index ["catuser_id"], name: "index_catcomments_on_catuser_id"
  end

  create_table "catusers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_catusers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_catusers_on_reset_password_token", unique: true
  end

  create_table "reactions", force: :cascade do |t|
    t.bigint "article_id", null: false
    t.bigint "catuser_id", null: false
    t.string "kind"
    t.string "reaction_type"
    t.bigint "catcomment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_reactions_on_article_id"
    t.index ["catcomment_id"], name: "index_reactions_on_catcomment_id"
    t.index ["catuser_id"], name: "index_reactions_on_catuser_id"
  end

  add_foreign_key "articles", "aventures"
  add_foreign_key "catcomments", "articles"
  add_foreign_key "catcomments", "catusers"
  add_foreign_key "reactions", "articles"
  add_foreign_key "reactions", "catcomments"
  add_foreign_key "reactions", "catusers"
end
