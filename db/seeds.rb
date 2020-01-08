# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Code you want to run in all environments HERE
# ...
#load(Rails.root.join( 'db', 'seeds', "#{Rails.env.downcase}.rb"))
# to run seed -> db:seed RAILS_ENV=environment_name

adminDaniel = {
  name: "Daniel",
  lastname: "Suarez",
  phone: "643543345",
  city: "LP",
  country: "Spain"
}

nutritionistAlberto = {
  name: "Alberto",
  lastname: "Rodriguez",
  phone: "675765789",
  city: "Madrid",
  country: "Spain",
}

trainerAlvaro = {
  name: "Alvaro",
  lastname: "Perez",
  phone: "765567567",
  city: "Valencia",
  country: "Spain",
}

psychologistPepe = {
  name: "Pepe",
  lastname: "Gomez",
  phone: "765756798",
  city: "Barcelona",
  country: "Spain",
}

physiotherapistPaco = {
  name: "Paco",
  lastname: "Diaz",
  phone: "654234123",
  city: "Sevilla",
  country: "Spain",
}

userJavi = {
  name: "Javier",
  lastname: "Rodriguez",
  phone: "657765765",
  city: "Santa Cruz",
  country: "Spain",
}

userJuan = {
  name: "Juan",
  lastname: "Santana",
  phone: "765896345",
  city: "Murcia",
  country: "Spain",
}

userManolo = {
  name: "Manolo",
  lastname: "Perez",
  phone: "654786653",
  city: "LP",
  country: "Spain"
}

User.create(adminDaniel)
User.create(nutritionistAlberto)
User.create(physiotherapistPaco)
User.create(psychologistPepe)
User.create(userJavi)
User.create(userJuan)
User.create(userManolo)

