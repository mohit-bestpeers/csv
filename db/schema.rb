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

ActiveRecord::Schema[7.0].define(version: 2023_12_13_050816) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accessories_accounts", id: false, force: :cascade do |t|
    t.bigint "accessory_id", null: false
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accessory_id", "account_id"], name: "index_accessories_accounts_on_accessory_id_and_account_id"
  end

  create_table "account_categories", force: :cascade do |t|
    t.integer "account_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "account_groups_account_groups", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "account_groups_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_groups_group_id"], name: "index_account_groups_account_groups_on_account_groups_group_id"
    t.index ["account_id"], name: "index_account_groups_account_groups_on_account_id"
  end

  create_table "account_groups_groups", force: :cascade do |t|
    t.string "name"
    t.jsonb "settings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accounts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "full_phone_number"
    t.integer "country_code"
    t.bigint "phone_number"
    t.string "email"
    t.boolean "activated", default: false, null: false
    t.string "device_id"
    t.text "unique_auth_id"
    t.string "password_digest"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.string "platform"
    t.string "user_type"
    t.integer "app_language_id"
    t.datetime "last_visit_at", precision: nil
    t.boolean "is_blacklisted", default: false
    t.date "suspend_until"
    t.integer "status", default: 0, null: false
    t.string "stripe_id"
    t.string "stripe_subscription_id"
    t.datetime "stripe_subscription_date", precision: nil
    t.string "full_name"
    t.integer "role_id"
    t.string "style"
    t.string "image_source"
    t.date "dob"
    t.string "country"
    t.bigint "style_id"
    t.boolean "notification_enabled", default: false
    t.text "outfit_ids", default: [], array: true
    t.text "lookbook_ids", default: [], array: true
  end

  create_table "accounts_catalogues", id: false, force: :cascade do |t|
    t.bigint "catalogue_id", null: false
    t.bigint "account_id", null: false
    t.index ["catalogue_id", "account_id"], name: "index_accounts_catalogues_on_catalogue_id_and_account_id"
  end

  create_table "accounts_chats", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "chat_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "muted", default: false
    t.index ["account_id"], name: "index_accounts_chats_on_account_id"
    t.index ["chat_id"], name: "index_accounts_chats_on_chat_id"
  end

  create_table "accounts_closet_albums", id: false, force: :cascade do |t|
    t.bigint "closet_album_id", null: false
    t.bigint "account_id", null: false
    t.index ["closet_album_id", "account_id"], name: "index_accounts_closet_albums_on_closet_album_id_and_account_id"
  end

  create_table "accounts_clothes", id: false, force: :cascade do |t|
    t.bigint "clothe_id", null: false
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clothe_id", "account_id"], name: "index_accounts_clothes_on_clothe_id_and_account_id"
  end

  create_table "accounts_look_books", id: false, force: :cascade do |t|
    t.bigint "look_book_id", null: false
    t.bigint "account_id", null: false
    t.index ["look_book_id", "account_id"], name: "index_accounts_look_books_on_look_book_id_and_account_id"
  end

  create_table "accounts_poll_options", id: false, force: :cascade do |t|
    t.bigint "poll_option_id", null: false
    t.bigint "account_id", null: false
    t.index ["poll_option_id", "account_id"], name: "index_accounts_poll_options_on_poll_option_id_and_account_id"
  end

  create_table "accounts_posts", id: false, force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "account_id", null: false
    t.index ["post_id", "account_id"], name: "index_accounts_posts_on_post_id_and_account_id"
  end

  create_table "action_mailbox_inbound_emails", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.string "message_id", null: false
    t.string "message_checksum", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id", "message_checksum"], name: "index_action_mailbox_inbound_emails_uniqueness", unique: true
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.boolean "default_image", default: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "albums_items", id: false, force: :cascade do |t|
    t.bigint "album_id", null: false
    t.bigint "item_id", null: false
    t.index ["album_id", "item_id"], name: "index_albums_items_on_album_id_and_item_id"
  end

  create_table "associated_projects", force: :cascade do |t|
    t.integer "project_id"
    t.integer "associated_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "associateds", force: :cascade do |t|
    t.string "associated_with_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attachments", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.string "colour"
    t.string "layout"
    t.string "page_size"
    t.string "scale"
    t.string "print_sides"
    t.integer "print_pages_from"
    t.integer "print_pages_to"
    t.integer "total_pages"
    t.boolean "is_expired", default: false
    t.integer "total_attachment_pages"
    t.string "pdf_url"
    t.boolean "is_printed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_attachments_on_account_id"
  end

  create_table "awards", force: :cascade do |t|
    t.string "title"
    t.string "associated_with"
    t.string "issuer"
    t.datetime "issue_date", precision: nil
    t.text "description"
    t.boolean "make_public", default: false, null: false
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "black_list_users", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_blocked", default: false
    t.integer "current_user_id"
    t.index ["account_id"], name: "index_black_list_users_on_account_id"
  end

  create_table "body_informations", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.string "height"
    t.string "breast_size"
    t.string "waist"
    t.string "hip"
    t.string "hat_size"
    t.string "preferred_fit"
    t.string "shoe_size"
    t.string "foot_width_type"
    t.string "closet_preference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shoes_info_id"
    t.index ["account_id"], name: "index_body_informations_on_account_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "breast_sizes", force: :cascade do |t|
    t.string "breast_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bx_block_catalogue_carousels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bx_block_categories_styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bx_block_chat_shared_moodboards", force: :cascade do |t|
    t.bigint "chat_id", null: false
    t.bigint "mood_board_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "message_id"
    t.index ["chat_id"], name: "index_bx_block_chat_shared_moodboards_on_chat_id"
  end

  create_table "bx_block_communityforum_community_blocks", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "bx_block_community_forum_forum_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bx_block_communityforum_community_forum_posts", force: :cascade do |t|
    t.bigint "bx_block_community_forum_forum_id", null: false
    t.bigint "post_id", null: false
  end

  create_table "bx_block_communityforum_community_forums", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "topics"
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "post_request", default: false, null: false
    t.boolean "join_request", default: false, null: false
    t.integer "status", default: 0, null: false
  end

  create_table "bx_block_communityforum_community_joins", force: :cascade do |t|
    t.integer "bx_block_community_forum_forum_id"
    t.integer "account_id"
    t.boolean "followed", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.string "context"
  end

  create_table "bx_block_communityforum_posts", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.string "name"
    t.string "description"
    t.string "body"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "mentioned_user", default: [], array: true
    t.string "options", default: [], array: true
    t.integer "subcommunity_ids", default: [], array: true
    t.integer "hashtag_ids", default: [], array: true
    t.index ["account_id"], name: "index_bx_block_communityforum_posts_on_account_id"
  end

  create_table "bx_block_contentmoderation_contents", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bx_block_followers_requests", force: :cascade do |t|
    t.integer "account_id"
    t.integer "sender_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "request_type"
  end

  create_table "bx_block_libraries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bx_block_notifsettings_from_myestiles", force: :cascade do |t|
    t.boolean "announcements"
    t.boolean "reminders"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "form_type"
  end

  create_table "bx_block_notifsettings_trustee_and_communities", force: :cascade do |t|
    t.boolean "trustee_requests"
    t.boolean "accepted_trustee_requests"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
  end

  create_table "bx_block_portfolio_management_albums", force: :cascade do |t|
    t.string "format"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
  end

  create_table "bx_block_portfolio_management_closet_albums", force: :cascade do |t|
    t.string "title"
    t.string "format"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "images"
    t.text "tag_ids", default: [], array: true
    t.text "item_ids", default: [], array: true
    t.bigint "account_id"
    t.boolean "is_added", default: false
    t.boolean "is_add", default: false
    t.string "trial_pics"
    t.string "outfit_image"
    t.boolean "is_profile", default: false
    t.boolean "is_pro_lookbook", default: false
    t.string "status", default: "published"
    t.text "position", default: [], array: true
  end

  create_table "bx_block_portfolio_management_closet_sections", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bx_block_portfolio_management_items", force: :cascade do |t|
    t.string "file_format"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "filename"
  end

  create_table "bx_block_portfolio_management_look_books", force: :cascade do |t|
    t.string "title"
    t.text "tag_ids", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "closet_album_ids", default: [], array: true
    t.bigint "account_id"
  end

  create_table "bx_block_portfolio_management_shared_look_books", force: :cascade do |t|
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.bigint "look_book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bx_block_portfolio_management_shared_outfits", force: :cascade do |t|
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.bigint "closet_album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bx_block_posts_subcommunities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bx_block_reviews_archive_reviews", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.string "archiveable_type", null: false
    t.bigint "archiveable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_bx_block_reviews_archive_reviews_on_account_id"
    t.index ["archiveable_type", "archiveable_id"], name: "index_archive_reviews_on_archiveable"
  end

  create_table "bx_block_reviews_post_reviews", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "post_id", null: false
    t.string "comment"
    t.integer "rating"
    t.boolean "is_published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_bx_block_reviews_post_reviews_on_account_id"
    t.index ["post_id"], name: "index_bx_block_reviews_post_reviews_on_post_id"
  end

  create_table "career_experience_employment_types", force: :cascade do |t|
    t.integer "career_experience_id"
    t.integer "employment_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "career_experience_industry", force: :cascade do |t|
    t.integer "career_experience_id"
    t.integer "industry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "career_experience_system_experiences", force: :cascade do |t|
    t.integer "career_experience_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "system_experience_id"
  end

  create_table "career_experiences", force: :cascade do |t|
    t.string "job_title"
    t.date "start_date"
    t.date "end_date"
    t.string "company_name"
    t.text "description"
    t.string "add_key_achievements", default: [], array: true
    t.boolean "make_key_achievements_public", default: false, null: false
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "current_salary", default: "0.0"
    t.text "notice_period"
    t.date "notice_period_end_date"
    t.boolean "currently_working_here", default: false
  end

  create_table "catalogue_items", force: :cascade do |t|
    t.integer "item_type"
    t.integer "state"
    t.bigint "account_id"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "hashtag_id"
    t.bigint "catalogue_variant_color_id"
    t.bigint "catalogue_variant_size_id"
    t.bigint "brand_id"
    t.text "tag_ids", default: [], array: true
    t.bigint "carousel_id"
    t.bigint "catalogue_id"
    t.bigint "sub_category_id"
    t.index ["account_id"], name: "index_catalogue_items_on_account_id"
    t.index ["brand_id"], name: "index_catalogue_items_on_brand_id"
    t.index ["catalogue_variant_color_id"], name: "index_catalogue_items_on_catalogue_variant_color_id"
    t.index ["catalogue_variant_size_id"], name: "index_catalogue_items_on_catalogue_variant_size_id"
    t.index ["category_id"], name: "index_catalogue_items_on_category_id"
    t.index ["hashtag_id"], name: "index_catalogue_items_on_hashtag_id"
  end

  create_table "catalogue_reviews", force: :cascade do |t|
    t.bigint "catalogue_id", null: false
    t.string "comment"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id", null: false
    t.integer "product_size"
    t.integer "price"
    t.string "title"
    t.integer "state", default: 0
    t.index ["catalogue_id"], name: "index_catalogue_reviews_on_catalogue_id"
  end

  create_table "catalogue_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "catalogue_variant_colors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color_code"
  end

  create_table "catalogue_variant_sizes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "catalogue_variants", force: :cascade do |t|
    t.bigint "catalogue_id", null: false
    t.bigint "catalogue_variant_color_id"
    t.bigint "catalogue_variant_size_id"
    t.decimal "price"
    t.integer "stock_qty"
    t.boolean "on_sale"
    t.decimal "sale_price"
    t.decimal "discount_price"
    t.float "length"
    t.float "breadth"
    t.float "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "block_qty"
    t.index ["catalogue_id"], name: "index_catalogue_variants_on_catalogue_id"
    t.index ["catalogue_variant_color_id"], name: "index_catalogue_variants_on_catalogue_variant_color_id"
    t.index ["catalogue_variant_size_id"], name: "index_catalogue_variants_on_catalogue_variant_size_id"
  end

  create_table "catalogues", force: :cascade do |t|
    t.bigint "sub_category_id"
    t.bigint "brand_id"
    t.string "name"
    t.string "description"
    t.integer "availability"
    t.float "price"
    t.boolean "recommended"
    t.boolean "on_sale"
    t.decimal "sale_price"
    t.decimal "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "block_qty"
    t.string "web_url"
    t.integer "gender"
    t.bigint "style_id"
    t.bigint "carousel_id"
    t.integer "reviews_count"
    t.boolean "add_wishlist", default: false
    t.bigint "catalogue_variant_color_id"
    t.index ["brand_id"], name: "index_catalogues_on_brand_id"
    t.index ["sub_category_id"], name: "index_catalogues_on_sub_category_id"
  end

  create_table "catalogues_tags", force: :cascade do |t|
    t.bigint "catalogue_id", null: false
    t.bigint "catalogue_tag_id", null: false
    t.index ["catalogue_id"], name: "index_catalogues_tags_on_catalogue_id"
    t.index ["catalogue_tag_id"], name: "index_catalogues_tags_on_catalogue_tag_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "admin_user_id"
    t.integer "rank"
    t.string "light_icon"
    t.string "light_icon_active"
    t.string "light_icon_inactive"
    t.string "dark_icon"
    t.string "dark_icon_active"
    t.string "dark_icon_inactive"
    t.integer "identifier"
    t.string "color_code"
  end

  create_table "categories_sub_categories", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "sub_category_id", null: false
    t.index ["category_id"], name: "index_categories_sub_categories_on_category_id"
    t.index ["sub_category_id"], name: "index_categories_sub_categories_on_sub_category_id"
  end

  create_table "chat_messages", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "chat_id"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_mark_read", default: false
    t.integer "message_type"
    t.string "attachment"
    t.boolean "message_requests"
    t.boolean "messages"
    t.integer "current_user_id"
    t.integer "product_id"
    t.integer "item_id"
    t.integer "post_id"
    t.integer "review_id"
    t.integer "mentioned_user", default: [], array: true
    t.integer "tag_user", default: [], array: true
    t.integer "closet_album_id"
    t.integer "look_book_id"
    t.bigint "item_review_id"
    t.bigint "mood_board_id"
    t.index ["account_id"], name: "index_chat_messages_on_account_id"
    t.index ["chat_id"], name: "index_chat_messages_on_chat_id"
    t.index ["item_review_id"], name: "index_chat_messages_on_item_review_id"
  end

  create_table "chats", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: ""
    t.integer "chat_type", null: false
    t.bigint "account_id", null: false
    t.integer "current_user_id"
    t.index ["account_id"], name: "index_chats_on_account_id"
  end

  create_table "closet_accesses", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "current_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_closet_accesses_on_account_id"
    t.index ["current_user_id"], name: "index_closet_accesses_on_current_user_id"
  end

  create_table "closet_albums_items", id: false, force: :cascade do |t|
    t.bigint "closet_album_id", null: false
    t.bigint "item_id", null: false
    t.index ["closet_album_id", "item_id"], name: "index_closet_albums_items_on_closet_album_id_and_item_id"
  end

  create_table "closet_albums_look_books", id: false, force: :cascade do |t|
    t.bigint "look_book_id"
    t.bigint "closet_album_id"
  end

  create_table "closet_preferences", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clothes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "commentable_id"
    t.string "commentable_type"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "parent_comment_id"
    t.integer "mentioned_users", default: [], array: true
    t.index ["account_id"], name: "index_comments_on_account_id"
    t.index ["parent_comment_id"], name: "index_comments_on_parent_comment_id"
  end

  create_table "connections", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.integer "receipient_id"
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_connections_on_account_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.bigint "account_id"
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "subject"
    t.index ["account_id"], name: "index_contacts_on_account_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_name"
    t.string "duration"
    t.string "year"
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cta", force: :cascade do |t|
    t.string "headline"
    t.text "description"
    t.bigint "category_id"
    t.string "long_background_image"
    t.string "square_background_image"
    t.string "button_text"
    t.string "redirect_url"
    t.integer "text_alignment"
    t.integer "button_alignment"
    t.boolean "is_square_cta"
    t.boolean "is_long_rectangle_cta"
    t.boolean "is_text_cta"
    t.boolean "is_image_cta"
    t.boolean "has_button"
    t.boolean "visible_on_home_page"
    t.boolean "visible_on_details_page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_cta_on_category_id"
  end

  create_table "current_annual_salaries", force: :cascade do |t|
    t.string "current_annual_salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "current_annual_salary_current_status", force: :cascade do |t|
    t.integer "current_status_id"
    t.integer "current_annual_salary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "current_status", force: :cascade do |t|
    t.string "most_recent_job_title"
    t.string "company_name"
    t.text "notice_period"
    t.date "end_date"
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "current_status_employment_types", force: :cascade do |t|
    t.integer "current_status_id"
    t.integer "employment_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "current_status_industries", force: :cascade do |t|
    t.integer "current_status_id"
    t.integer "industry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "degree_educational_qualifications", force: :cascade do |t|
    t.integer "educational_qualification_id"
    t.integer "degree_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "degrees", force: :cascade do |t|
    t.string "degree_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educational_qualification_field_study", force: :cascade do |t|
    t.integer "educational_qualification_id"
    t.integer "field_study_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educational_qualifications", force: :cascade do |t|
    t.string "school_name"
    t.date "start_date"
    t.date "end_date"
    t.string "grades"
    t.text "description"
    t.boolean "make_grades_public", default: false, null: false
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_otps", force: :cascade do |t|
    t.string "email"
    t.integer "pin"
    t.boolean "activated", default: false, null: false
    t.datetime "valid_until", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employment_types", force: :cascade do |t|
    t.string "employment_type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.string "question"
    t.string "answer"
  end

  create_table "field_study", force: :cascade do |t|
    t.string "field_of_study"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "followers_follows", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "current_user_id"
    t.index ["account_id"], name: "index_followers_follows_on_account_id"
    t.index ["current_user_id"], name: "index_followers_follows_on_current_user_id"
  end

  create_table "foot_width_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "giveaway_participations", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "closet_preference", default: [], array: true
    t.integer "posts", default: [], array: true
    t.integer "review_items", default: [], array: true
    t.index ["account_id"], name: "index_giveaway_participations_on_account_id"
    t.index ["survey_id"], name: "index_giveaway_participations_on_survey_id"
  end

  create_table "global_settings", force: :cascade do |t|
    t.string "notice_period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hashtags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "help_centers", force: :cascade do |t|
    t.bigint "account_id"
    t.string "subject"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_help_centers_on_account_id"
  end

  create_table "hobbies_and_interests", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.text "description"
    t.boolean "make_public", default: false, null: false
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "industries", force: :cascade do |t|
    t.string "industry_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "description"
    t.integer "price"
    t.integer "item_size"
    t.bigint "account_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.integer "state", default: 0
  end

  create_table "languages", force: :cascade do |t|
    t.string "language"
    t.string "proficiency"
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "like_by_id"
    t.string "likeable_type", null: false
    t.bigint "likeable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "comments_on_your_photos"
    t.integer "mentions"
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id"
  end

  create_table "mentions_taggings", force: :cascade do |t|
    t.string "taggable_type"
    t.bigint "taggable_id"
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_mentions_taggings_on_account_id"
    t.index ["taggable_type", "taggable_id"], name: "index_mentions_taggings_on_taggable_type_and_taggable_id"
  end

  create_table "moodboards", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "members", default: [], array: true
    t.bigint "account_id"
    t.string "status", default: "published"
    t.index ["account_id"], name: "index_moodboards_on_account_id"
  end

  create_table "navigation_menus", force: :cascade do |t|
    t.string "position", comment: "Where will this navigation item be present"
    t.json "items", comment: "Navigation Menu Items, combination of url and name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notification_groups", force: :cascade do |t|
    t.integer "group_type"
    t.string "group_name"
    t.bigint "notification_setting_id", null: false
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notification_setting_id"], name: "index_notification_groups_on_notification_setting_id"
  end

  create_table "notification_settings", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notification_subgroups", force: :cascade do |t|
    t.integer "subgroup_type"
    t.string "subgroup_name"
    t.bigint "notification_group_id", null: false
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notification_group_id"], name: "index_notification_subgroups_on_notification_group_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "created_by"
    t.string "headings"
    t.string "contents"
    t.string "app_url"
    t.boolean "is_read", default: false
    t.datetime "read_at", precision: nil
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_notifications_on_account_id"
  end

  create_table "poll_options", force: :cascade do |t|
    t.string "name"
    t.bigint "post_id", null: false
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_poll_options_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "body"
    t.string "location"
    t.integer "account_id"
    t.text "option", default: [], array: true
    t.text "hashtag_ids", default: [], array: true
    t.bigint "category_id"
    t.string "category"
    t.datetime "expires_in", precision: nil
    t.boolean "is_survey", default: false
    t.string "status", default: "published"
    t.bigint "subcommunity_id"
    t.boolean "is_flagged", default: false
    t.boolean "is_bookmark", default: false
    t.index ["category_id"], name: "index_posts_on_category_id"
  end

  create_table "preferred_fits", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "privacy_policies", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
  end

  create_table "privacy_settings", force: :cascade do |t|
    t.integer "account_id"
    t.boolean "latest_activity", default: true
    t.boolean "older_activity", default: false
    t.boolean "in_app_notification", default: true
    t.boolean "chat_notification", default: true
    t.boolean "friend_request", default: true
    t.boolean "interest_received", default: true
    t.boolean "viewed_profile", default: true
    t.boolean "off_all_notification", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "like_notification", default: true
    t.boolean "post_notification", default: true
    t.boolean "show_trustee", default: false
    t.boolean "announcements_notification", default: false
    t.boolean "reminders_notification", default: false
    t.boolean "messages_request_notification", default: false
    t.boolean "messages_notification", default: false
    t.boolean "trustee_requests_notification", default: false
    t.boolean "accepted_trustee_requests_notification", default: false
    t.integer "mentions_notification", default: 0, null: false
    t.integer "comment_notification", default: 0, null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "country"
    t.string "address"
    t.string "postal_code"
    t.integer "account_id"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_role"
    t.string "city"
  end

  create_table "projects", force: :cascade do |t|
    t.string "project_name"
    t.date "start_date"
    t.date "end_date"
    t.string "add_members"
    t.string "url"
    t.text "description"
    t.boolean "make_projects_public", default: false, null: false
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publication_patents", force: :cascade do |t|
    t.string "title"
    t.string "publication"
    t.string "authors"
    t.string "url"
    t.text "description"
    t.boolean "make_public", default: false, null: false
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "push_notifications", force: :cascade do |t|
    t.bigint "account_id"
    t.string "push_notificable_type", null: false
    t.bigint "push_notificable_id", null: false
    t.string "remarks"
    t.boolean "is_read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.index ["account_id"], name: "index_push_notifications_on_account_id"
    t.index ["push_notificable_type", "push_notificable_id"], name: "index_push_notification_type_and_id"
  end

  create_table "report_reasons", force: :cascade do |t|
    t.string "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.string "reason"
    t.integer "report_type"
    t.string "reportable_type", null: false
    t.bigint "reportable_id", null: false
    t.bigint "account_id", null: false
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "report_reason_id"
    t.index ["account_id"], name: "index_reports_on_account_id"
    t.index ["report_reason_id"], name: "index_reports_on_report_reason_id"
    t.index ["reportable_type", "reportable_id"], name: "index_reports_on_reportable_type_and_reportable_id"
  end

  create_table "reviews_reviews", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "account_id"
    t.integer "reviewer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "anonymous", default: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seller_accounts", force: :cascade do |t|
    t.string "firm_name"
    t.string "full_phone_number"
    t.text "location"
    t.integer "country_code"
    t.bigint "phone_number"
    t.string "gstin_number"
    t.boolean "wholesaler"
    t.boolean "retailer"
    t.boolean "manufacturer"
    t.boolean "hallmarking_center"
    t.float "buy_gold"
    t.float "buy_silver"
    t.float "sell_gold"
    t.float "sell_silver"
    t.string "deal_in", default: [], array: true
    t.text "about_us"
    t.boolean "activated", default: false, null: false
    t.bigint "account_id", null: false
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "long", precision: 10, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_seller_accounts_on_account_id"
  end

  create_table "send_mood_boards", force: :cascade do |t|
    t.bigint "moodboards_id", null: false
    t.integer "account_id", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sender_id"
    t.index ["moodboards_id"], name: "index_send_mood_boards_on_moodboards_id"
  end

  create_table "send_posts", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.integer "account_id", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sender_id"
    t.index ["post_id"], name: "index_send_posts_on_post_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string "title"
    t.string "name"
  end

  create_table "shoes_infos", force: :cascade do |t|
    t.string "value"
    t.integer "value_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sms_otps", force: :cascade do |t|
    t.string "full_phone_number"
    t.integer "pin"
    t.boolean "activated", default: false, null: false
    t.datetime "valid_until", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "parent_id"
    t.integer "rank"
  end

  create_table "surveys", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.datetime "start_time", precision: nil
    t.datetime "expiry_time", precision: nil
    t.string "background_color"
    t.string "button_color"
    t.string "button_text"
    t.string "button_color_task_1"
    t.string "button_color_task_2"
    t.string "button_text_task_1"
    t.string "button_text_task_2"
    t.integer "number_of_entries_task_1"
    t.integer "number_of_entries_task_2"
    t.integer "task_1"
    t.integer "task_2"
  end

  create_table "system_experiences", force: :cascade do |t|
    t.string "system_experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "terms_and_conditions", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
  end

  create_table "test_score_and_courses", force: :cascade do |t|
    t.string "title"
    t.string "associated_with"
    t.string "score"
    t.datetime "test_date", precision: nil
    t.text "description"
    t.boolean "make_public", default: false, null: false
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_categories", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_user_categories_on_account_id"
    t.index ["category_id"], name: "index_user_categories_on_category_id"
  end

  create_table "user_sub_categories", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "sub_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_user_sub_categories_on_account_id"
    t.index ["sub_category_id"], name: "index_user_sub_categories_on_sub_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "pushups"
    t.integer "situps"
    t.integer "steps"
    t.integer "pullups"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.string "option"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id"
    t.index ["account_id"], name: "index_votes_on_account_id"
    t.index ["post_id"], name: "index_votes_on_post_id"
  end

  add_foreign_key "account_groups_account_groups", "account_groups_groups"
  add_foreign_key "account_groups_account_groups", "accounts"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "attachments", "accounts"
  add_foreign_key "black_list_users", "accounts"
  add_foreign_key "body_informations", "accounts"
  add_foreign_key "bx_block_chat_shared_moodboards", "chats"
  add_foreign_key "bx_block_communityforum_community_blocks", "accounts"
  add_foreign_key "bx_block_communityforum_community_blocks", "bx_block_communityforum_community_forums", column: "bx_block_community_forum_forum_id"
  add_foreign_key "bx_block_communityforum_community_forum_posts", "bx_block_communityforum_community_forums", column: "bx_block_community_forum_forum_id"
  add_foreign_key "bx_block_communityforum_community_forum_posts", "posts"
  add_foreign_key "bx_block_communityforum_community_forums", "accounts"
  add_foreign_key "bx_block_communityforum_posts", "accounts"
  add_foreign_key "bx_block_reviews_archive_reviews", "accounts"
  add_foreign_key "bx_block_reviews_post_reviews", "accounts"
  add_foreign_key "bx_block_reviews_post_reviews", "posts"
  add_foreign_key "catalogue_items", "accounts"
  add_foreign_key "catalogue_items", "brands"
  add_foreign_key "catalogue_items", "catalogue_variant_colors"
  add_foreign_key "catalogue_items", "catalogue_variant_sizes"
  add_foreign_key "catalogue_items", "categories"
  add_foreign_key "catalogue_items", "hashtags"
  add_foreign_key "catalogue_reviews", "catalogues"
  add_foreign_key "catalogue_variants", "catalogue_variant_colors"
  add_foreign_key "catalogue_variants", "catalogue_variant_sizes"
  add_foreign_key "catalogue_variants", "catalogues"
  add_foreign_key "catalogues", "brands"
  add_foreign_key "catalogues", "sub_categories"
  add_foreign_key "catalogues_tags", "catalogue_tags"
  add_foreign_key "catalogues_tags", "catalogues"
  add_foreign_key "categories_sub_categories", "categories"
  add_foreign_key "categories_sub_categories", "sub_categories"
  add_foreign_key "chat_messages", "accounts"
  add_foreign_key "chat_messages", "accounts", column: "current_user_id"
  add_foreign_key "chat_messages", "chats"
  add_foreign_key "chats", "accounts"
  add_foreign_key "chats", "accounts", column: "current_user_id"
  add_foreign_key "closet_accesses", "accounts"
  add_foreign_key "closet_accesses", "accounts", column: "current_user_id"
  add_foreign_key "comments", "accounts"
  add_foreign_key "comments", "comments", column: "parent_comment_id", on_delete: :cascade
  add_foreign_key "connections", "accounts"
  add_foreign_key "followers_follows", "accounts"
  add_foreign_key "followers_follows", "accounts", column: "current_user_id"
  add_foreign_key "giveaway_participations", "accounts"
  add_foreign_key "giveaway_participations", "surveys"
  add_foreign_key "mentions_taggings", "accounts"
  add_foreign_key "notification_groups", "notification_settings"
  add_foreign_key "notification_subgroups", "notification_groups"
  add_foreign_key "notifications", "accounts"
  add_foreign_key "poll_options", "posts"
  add_foreign_key "posts", "categories"
  add_foreign_key "push_notifications", "accounts"
  add_foreign_key "reports", "accounts"
  add_foreign_key "reports", "report_reasons"
  add_foreign_key "seller_accounts", "accounts"
  add_foreign_key "send_mood_boards", "moodboards", column: "moodboards_id"
  add_foreign_key "send_posts", "posts"
  add_foreign_key "user_categories", "accounts"
  add_foreign_key "user_categories", "categories"
  add_foreign_key "user_sub_categories", "accounts"
  add_foreign_key "user_sub_categories", "sub_categories"
  add_foreign_key "votes", "posts"
end
