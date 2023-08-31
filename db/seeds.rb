# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

i = 0
until Catuser.count == 20 do
    Catuser.create(email: "test#{i}@gmail", password: "asdasdasd",
    name: Faker:: Name.name)
    i += 1
    end

until Aventure.count == 20 do
    Aventure.create(name: Faker::Mountain.name) if !Aventure.pluck(:name).include?(Faker::Mountain.name)
end

aventures = Aventure.all

until Article.count == 20 do
    Article.create(title: Faker::Book.title, description: 
    Faker::Lorem.paragraph_by_chars(number: 100, supplemental: false), 
    photo: Faker::LoremFlickr.image, when_went:
    Faker::Date.between(from: 05.years.ago, to: Date.today), aventure_id:
    aventures.sample.id)
 end

    articles = Article.all
    catusers = Catuser.all

until Catcomment.count == 20 do
    Catcomment.create(content: Faker::Lorem.paragraph_by_chars(number: 100,
    supplemental: false), article_id: articles.sample.id, catuser_id: catusers.sample.id)
 end

   