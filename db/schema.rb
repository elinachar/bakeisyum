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

ActiveRecord::Schema.define(version: 2020_11_27_115018) do

  create_table "comments", force: :cascade do |t|
    t.string "cοmmentator"
    t.text "body"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approved", default: false, null: false
    t.index ["recipe_id"], name: "index_comments_on_recipe_id"
  end

  create_table "description_translations", force: :cascade do |t|
    t.integer "description_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["description_id"], name: "index_description_translations_on_description_id"
    t.index ["locale"], name: "index_description_translations_on_locale"
  end

  create_table "descriptions", force: :cascade do |t|
    t.text "description"
    t.string "image_url"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_descriptions_on_recipe_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_favorites_on_recipe_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.string "locale"
    t.index ["locale"], name: "index_friendly_id_slugs_on_locale"
    t.index ["slug", "sluggable_type", "locale"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_locale"
    t.index ["slug", "sluggable_type", "scope", "locale"], name: "index_friendly_id_slugs_uniqueness", unique: true
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "ingredient_translations", force: :cascade do |t|
    t.integer "ingredient_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.float "weight"
    t.string "weight_unit"
    t.float "weight_optional"
    t.string "weight_optional_unit"
    t.index ["ingredient_id"], name: "index_ingredient_translations_on_ingredient_id"
    t.index ["locale"], name: "index_ingredient_translations_on_locale"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.float "weight"
    t.string "weight_unit"
    t.float "weight_optional"
    t.string "weight_optional_unit"
    t.integer "part_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_id"], name: "index_ingredients_on_part_id"
  end

  create_table "instruction_translations", force: :cascade do |t|
    t.integer "instruction_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "instruction"
    t.index ["instruction_id"], name: "index_instruction_translations_on_instruction_id"
    t.index ["locale"], name: "index_instruction_translations_on_locale"
  end

  create_table "instructions", force: :cascade do |t|
    t.text "instruction"
    t.integer "part_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_id"], name: "index_instructions_on_part_id"
  end

  create_table "note_translations", force: :cascade do |t|
    t.integer "note_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "note"
    t.index ["locale"], name: "index_note_translations_on_locale"
    t.index ["note_id"], name: "index_note_translations_on_note_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text "note"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_notes_on_recipe_id"
  end

  create_table "part_translations", force: :cascade do |t|
    t.integer "part_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["locale"], name: "index_part_translations_on_locale"
    t.index ["part_id"], name: "index_part_translations_on_part_id"
  end

  create_table "parts", force: :cascade do |t|
    t.string "name"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_parts_on_recipe_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "rating"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_ratings_on_recipe_id"
  end

  create_table "recipe_translations", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "short_description"
    t.string "serving"
    t.string "preparation_time"
    t.string "cooking_time"
    t.string "waiting_time"
    t.string "original_recipie_author"
    t.string "cuisine"
    t.string "keywords"
    t.string "slug"
    t.index ["locale"], name: "index_recipe_translations_on_locale"
    t.index ["recipe_id"], name: "index_recipe_translations_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.text "short_description"
    t.string "serving"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.string "preparation_time"
    t.string "cooking_time"
    t.string "waiting_time"
    t.string "original_recipie_author"
    t.string "original_recipie_url"
    t.string "square_image_url"
    t.string "photos_from"
    t.string "photos_from_url"
    t.boolean "public", default: false, null: false
    t.string "cuisine"
    t.string "keywords"
    t.boolean "new_recipe_email_sent", default: false
    t.string "ingredients_image_url"
    t.string "ingredients_text_image_url"
    t.string "video_url"
    t.string "slug"
    t.index ["name"], name: "index_recipes_on_name"
    t.index ["slug"], name: "index_recipes_on_slug", unique: true
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "language"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.boolean "subscribed", default: false, null: false
    t.boolean "admin", default: false, null: false
    t.boolean "author", default: false, null: false
    t.boolean "moderator", default: false, null: false
    t.boolean "agreement_terms", default: false
    t.string "language"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
