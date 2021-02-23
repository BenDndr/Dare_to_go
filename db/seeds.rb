# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Challenge.destroy_all

# create_table "challenges", force: :cascade do |t|
#     t.string "name"
#     t.integer "category"
#     t.integer "place"
#     t.text "content"
#     t.integer "xp"
#     t.integer "delay"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.integer "difficulty"
#   end

10.times {
  difficulty = rand(3)
  # Go to the librairy and ask the time to six people
  # Go to the nearest {place} and {verbe} to {num} people
  # va {place} le plus près et {verbe} à {} personnes
  a_place = ["à la librairie", "au bar", "au musée", "au magasin", "au tabac", "à la gare", "au cinéma"]
  a_verbe = ["demande l'heure", "dit bonjour", "parle du beau temps", "demande ton chemin", "montre du doigt", "suit pendant 5 min"]
  endroit = a_place[rand(7)]
  verbe = a_verbe[rand(6)]
  namedef = verbe + " " + endroit
  place = rand(10)
  num_personne = rand(10)
  content = "Va #{endroit} le plus près et #{verbe} à #{num_personne} personnes"
  xp = 10 * difficulty * num_personne
  delay = 10 * num_personne
  challenge = Challenge.create!(name: namedef, category: "solo", place: place, content: content, xp: xp, delay: delay, difficulty: difficulty)
}

puts "Finished!"