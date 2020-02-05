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
  country: "Spain",
  email: "daniel@correo.es",
  password: "nutrain"
}

nutritionistAlberto = {
  name: "Alberto",
  lastname: "Rodriguez",
  phone: "675765789",
  city: "Madrid",
  country: "Spain",
  email: "alberto@correo.es",
  password: "nutrain"
}

trainerAlvaro = {
  name: "Alvaro",
  lastname: "Perez",
  phone: "765567567",
  city: "Valencia",
  country: "Spain",
  email: "alvaro@correo.es",
  password: "nutrain"
}

psychologistPepe = {
  name: "Pepe",
  lastname: "Gomez",
  phone: "765756798",
  city: "Barcelona",
  country: "Spain",
  email: "pepe@correo.es",
  password: "nutrain"
}

physiotherapistPaco = {
  name: "Paco",
  lastname: "Diaz",
  phone: "654234123",
  city: "Sevilla",
  country: "Spain",
  email: "paco@correo.es",
  password: "nutrain"
}

userJavi = {
  name: "Javier",
  lastname: "Rodriguez",
  phone: "657765765",
  city: "Santa Cruz",
  country: "Spain",
  email: "javier@correo.es",
  password: "nutrain"
}

userJuan = {
  name: "Juan",
  lastname: "Santana",
  phone: "765896345",
  city: "Murcia",
  country: "Spain",
  email: "juan@correo.es",
  password: "nutrain"
}

userManolo = {
  name: "Manolo",
  lastname: "Perez",
  phone: "654786653",
  city: "LP",
  country: "Spain",
  email: "manolo@correo.es",
  password: "nutrain"
}

User.create(adminDaniel)
User.create(nutritionistAlberto)
User.create(physiotherapistPaco)
User.create(psychologistPepe)
User.create(userJavi)
User.create(userJuan)
User.create(userManolo)

