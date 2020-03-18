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
  age: "32",
  gender: "Male",
  height: "168",
  weight: "45",
  description: "",
  country: "Spain",
  email: "daniel@correo.es",
  password: "nutrain",
  nutritionist: false,
  trainer: false,
  physiotherapist: false,
  psychologist: false,
  verified: false
  #role: 'Admin'
}

nutritionistAlberto = {
  name: "Alberto",
  lastname: "Rodriguez",
  phone: "675765789",
  city: "Madrid",
  age: "23",
  gender: "Male",
  height: "176",
  weight: "63",
  description: "",
  country: "Spain",
  email: "alberto@correo.es",
  password: "nutrain",
  nutritionist: true,
  trainer: false,
  physiotherapist: false,
  psychologist: false,
  verified: false
  #role: 'Nutritionist'
}

trainerAlvaro = {
  name: "Alvaro",
  lastname: "Perez",
  phone: "765567567",
  city: "Valencia",
  age: "29",
  gender: "Male",
  height: "186",
  weight: "78",
  description: "",
  country: "Spain",
  email: "alvaro@correo.es",
  password: "nutrain",
  nutritionist: false,
  trainer: true,
  physiotherapist: false,
  psychologist: false,
  verified: false
  #role: 'Trainer'
}

psychologistPepe = {
  name: "Pepe",
  lastname: "Gomez",
  phone: "765756798",
  city: "Barcelona",
  age: "46",
  gender: "Male",
  height: "172",
  weight: "87",
  description: "",
  country: "Spain",
  email: "pepe@correo.es",
  password: "nutrain",
  nutritionist: false,
  trainer: false,
  physiotherapist: false,
  psychologist: true,
  verified: false
  #role: 'Psychologist'
}

physiotherapistPaco = {
  name: "Paco",
  lastname: "Diaz",
  phone: "654234123",
  city: "Sevilla",
  age: "30",
  gender: "Male",
  height: "177",
  weight: "78",
  description: "",
  country: "Spain",
  email: "paco@correo.es",
  password: "nutrain",
  nutritionist: false,
  trainer: false,
  physiotherapist: true,
  psychologist: false,
  verified: false
  #role: 'Physiotherapist'
}

userJavi = {
  name: "Javier",
  lastname: "Rodriguez",
  phone: "657765765",
  city: "Santa Cruz",
  age: "35",
  gender: "Male",
  height: "179",
  weight: "77",
  description: "",
  country: "Spain",
  email: "javier@correo.es",
  password: "nutrain",
  nutritionist: false,
  trainer: false,
  physiotherapist: false,
  psychologist: false,
  verified: false
  #role: 'User'
}

userJuan = {
  name: "Juan",
  lastname: "Santana",
  phone: "765896345",
  city: "Murcia",
  age: "42",
  gender: "Male",
  height: "177",
  weight: "72",
  description: "",
  country: "Spain",
  email: "juan@correo.es",
  password: "nutrain",
  nutritionist: false,
  trainer: false,
  physiotherapist: false,
  psychologist: false,
  verified: false
  #role: 'User'
}

userManolo = {
  name: "Manolo",
  lastname: "Perez",
  phone: "654786653",
  city: "LP",
  age: "25",
  gender: "Male",
  height: "178",
  weight: "65",
  description: "",
  country: "Spain",
  email: "manolo@correo.es",
  password: "nutrain",
  nutritionist: false,
  trainer: false,
  physiotherapist: false,
  psychologist: false,
  verified: false
  #type: 'User'
}

Admin.create(adminDaniel)
Professional.create(trainerAlvaro)
Professional.create(nutritionistAlberto)
Professional.create(physiotherapistPaco)
Professional.create(psychologistPepe)
Client.create(userJavi)
Client.create(userJuan)
Client.create(userManolo)

