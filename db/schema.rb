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

ActiveRecord::Schema.define(version: 2021_08_15_015512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anggota_keluargas", force: :cascade do |t|
    t.string "nama"
    t.string "nik"
    t.integer "jenis_kelamin"
    t.string "tempat_lahir"
    t.date "tanggal_lahir"
    t.bigint "nama_keluarga_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status_perkawinan"
    t.integer "status_hubungan"
    t.integer "sidi"
    t.integer "baptis"
    t.date "tanggal_meninggal"
    t.boolean "meninggal", default: false
    t.index ["nama_keluarga_id"], name: "index_anggota_keluargas_on_nama_keluarga_id"
  end

  create_table "keuangans", force: :cascade do |t|
    t.integer "nominal"
    t.integer "tipe"
    t.text "keterangan"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "koloms", force: :cascade do |t|
    t.string "nama"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "nama_keluargas", force: :cascade do |t|
    t.string "nama"
    t.string "nomor_kartu_keluarga"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "kolom"
    t.boolean "active", default: true
    t.date "tanggal_pernikahan"
    t.boolean "UlangTahunPernikahanAktif", default: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "username"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "anggota_keluargas", "nama_keluargas"
end
