# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


User.create(name: "Felippe Oka", email: "felippe.oka@gmail.com", phone: "+5511992283960", password: "123123", password_confirmation: "123123")

Lunchbox.create(food: "PF de carne", size: "small", price: 20, user_id: 1)
Lunchbox.create(food: "PF de carne", size: "medium", price: 22, user_id: 3)
Lunchbox.create(food: "PF de carne", size: "large", price: 25, user_id: 4)
Lunchbox.create(food: "PF de frango", size: "small", price: 18, user_id: 5)
Lunchbox.create(food: "PF de frango", size: "medium", price: 20, user_id: 1)
Lunchbox.create(food: "PF de frango", size: "large", price: 22, user_id: 3)
Lunchbox.create(food: "Galinhada", size: "medium", price: 25, user_id: 4)
