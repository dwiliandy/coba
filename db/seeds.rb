# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email:'admin@admin.com', username:'admin', password:'password', role:100, name:'admin')

MataPelajaran.create(nama: 'Matematika' )
MataPelajaran.create(nama: 'IPA')
MataPelajaran.create(nama: 'IPS' )
MataPelajaran.create(nama: 'Bahas Inggris' )
MataPelajaran.create(nama: 'Bahasa Indonesia' )
MataPelajaran.create(nama: 'Penjaskes' )
MataPelajaran.create(nama: 'TIK' )
