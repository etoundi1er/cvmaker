# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin   = User.find_by(admin: true, email: ENV['ADMIN_EMAIL'])
admin ||= User.create(admin: true, email: ENV['ADMIN_EMAIL'], name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PWD'], password_confirmation: ENV['ADMIN_PWD'])

Concerns::DummyData.new(admin).create
