# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

until Aventure.count == 20 do
    Aventure.create(name: Faker::Mountain.name) if !Aventure.pluck(:name).include?(Faker::Mountain.name)
end

aventures = Aventure.all

until Article.count == 50 do
    Article.create(title: Faker::Book.title, description: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false), photo: Faker::LoremFlickr.image, when_went:
    Faker::Date.between(from: 05.years.ago, to: Date.today), aventure_id:
    aventures.sample.id)
    end

    