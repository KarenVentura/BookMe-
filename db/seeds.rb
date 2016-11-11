# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

gynecology = Category.find_or_create_by(name: "Gynecology")
Category.find_or_create_by(name: "Dentist")
Category.find_or_create_by(name: "Doctor")
Category.find_or_create_by(name: "Mechanic")
Category.find_or_create_by(name: "Psychologist")
Category.find_or_create_by(name: "Dermatologist")
Category.find_or_create_by(name: "Spa")

user = User.create(name: "Karen", last_name: "Ventura", email: "ventura@gmail.com", telephone: "1231231231", cellphone: "1231231234")

Service.find_or_create_by(name: "Gynecology Gomez", description: "test", week_days: "Monday, Friday", category_id: gynecology.id, user_id: user.id)
