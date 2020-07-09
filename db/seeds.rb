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
  gender: "Male",
  description: "",
  country: "Spain",
  email: "daniel@correo.es",
  password: "nutrain",
  nutritionist: false,
  trainer: false,
  physiotherapist: false,
  psychologist: false,
  verified: false
}

nutritionistAlberto = {
  name: "Alberto",
  lastname: "Rodriguez",
  phone: "675765789",
  city: "Madrid",
  gender: "Male",
  description: "",
  country: "Spain",
  email: "alberto@correo.es",
  password: "nutrain",
  nutritionist: true,
  trainer: false,
  physiotherapist: false,
  psychologist: false,
  verified: false
}

trainerAlvaro = {
  name: "Alvaro",
  lastname: "Perez",
  phone: "765567567",
  city: "Valencia",
  gender: "Male",
  description: "",
  country: "Spain",
  email: "alvaro@correo.es",
  password: "nutrain",
  nutritionist: false,
  trainer: true,
  physiotherapist: false,
  psychologist: false,
  verified: false
}

trainerAurelio = {
  name: "Aurelio",
  lastname: "Sánchez",
  phone: "654678321",
  city: "Málaga",
  gender: "Male",
  description: "",
  country: "Spain",
  email: "aurelio@correo.es",
  password: "nutrain",
  nutritionist: false,
  trainer: true,
  physiotherapist: false,
  psychologist: false,
  verified: false
}

psychologistPepe = {
  name: "Pepe",
  lastname: "Gomez",
  phone: "765756798",
  city: "Barcelona",
  gender: "Male",
  description: "",
  country: "Spain",
  email: "pepe@correo.es",
  password: "nutrain",
  nutritionist: false,
  trainer: false,
  physiotherapist: false,
  psychologist: true,
  verified: false
}

physiotherapistPaco = {
  name: "Paco",
  lastname: "Diaz",
  phone: "654234123",
  city: "Sevilla",
  gender: "Male",
  description: "",
  country: "Spain",
  email: "paco@correo.es",
  password: "nutrain",
  nutritionist: false,
  trainer: false,
  physiotherapist: true,
  psychologist: false,
  verified: false
}

physiotherapistAlicia = {
  name: "Alicia",
  lastname: "Diaz",
  phone: "982786654",
  city: "Madrid",
  gender: "Female",
  description: "",
  country: "Spain",
  email: "alicia@correo.es",
  password: "nutrain",
  nutritionist: false,
  trainer: false,
  physiotherapist: true,
  psychologist: false,
  verified: false
}

userJavi = {
  name: "Javier",
  lastname: "Rodriguez",
  phone: "657765765",
  city: "Santa Cruz",
  gender: "Male",
  description: "",
  country: "Spain",
  email: "javier@correo.es",
  password: "nutrain",
  nutritionist: false,
  trainer: false,
  physiotherapist: false,
  psychologist: false,
  verified: false
}

userJuan = {
  name: "Juan",
  lastname: "Santana",
  phone: "765896345",
  city: "Murcia",
  gender: "Male",
  description: "",
  country: "Spain",
  email: "juan@correo.es",
  password: "nutrain",
  nutritionist: false,
  trainer: false,
  physiotherapist: false,
  psychologist: false,
  verified: false
}

userManolo = {
  name: "Manolo",
  lastname: "Perez",
  phone: "654786653",
  city: "LP",
  gender: "Male",
  description: "",
  country: "Spain",
  email: "manolo@correo.es",
  password: "nutrain",
  nutritionist: false,
  trainer: false,
  physiotherapist: false,
  psychologist: false,
  verified: false
}

userPepe = {
  name: "Manolo",
  lastname: "Perez",
  phone: "654786653",
  city: "LP",
  gender: "Male",
  description: "",
  country: "Spain",
  email: "manolo@correo.es",
  password: "nutrain",
  nutritionist: false,
  trainer: false,
  physiotherapist: false,
  psychologist: false,
  verified: false
}

userAntonio = {
  name: "Antonio",
  lastname: "Suárez",
  phone: "928543123",
  city: "Galicia",
  gender: "Male",
  description: "",
  country: "Spain",
  email: "antonio@correo.es",
  password: "nutrain",
  nutritionist: false,
  trainer: false,
  physiotherapist: false,
  psychologist: false,
  verified: false
}

userGabriela = {
  name: "Gabriela",
  lastname: "Álvarez",
  phone: "765567987",
  city: "Tarragona",
  gender: "Female",
  description: "",
  country: "Spain",
  email: "gabriela@correo.es",
  password: "nutrain",
  nutritionist: false,
  trainer: false,
  physiotherapist: false,
  psychologist: false,
  verified: false
}

userMaría = {
  name: "María",
  lastname: "Jiménez",
  phone: "654123543",
  city: "Murcia",
  gender: "Female",
  description: "",
  country: "Spain",
  email: "maria@correo.es",
  password: "nutrain",
  nutritionist: false,
  trainer: false,
  physiotherapist: false,
  psychologist: false,
  verified: false
}

userLaura = {
  name: "Laura",
  lastname: "Perez",
  phone: "329123543",
  city: "LP",
  gender: "Female",
  description: "",
  country: "Spain",
  email: "laura@correo.es",
  password: "nutrain",
  nutritionist: false,
  trainer: false,
  physiotherapist: false,
  psychologist: false,
  verified: false
}

Admin.create(adminDaniel)
Professional.create(trainerAlvaro)
Professional.create(trainerAurelio)
Professional.create(nutritionistAlberto)
Professional.create(physiotherapistPaco)
Professional.create(physiotherapistAlicia)
Professional.create(psychologistPepe)
Client.create(userJavi)
Client.create(userJuan)
Client.create(userManolo)
Client.create(userPepe)
Client.create(userAntonio)
Client.create(userGabriela)
Client.create(userMaría)
Client.create(userLaura)


