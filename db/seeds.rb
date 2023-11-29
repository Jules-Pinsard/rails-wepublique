require 'faker'

User.destroy_all
Category.destroy_all
Mesure.destroy_all
Observation.destroy_all
Comment.destroy_all
SubComment.destroy_all

User.create!([{ email: "j@j.com",
                first_name: "Jules",
                last_name: "Pinsard",
                password: "azerty",
                password_confirmation: "azerty",
                code: "" },
              { email: "m@m.com",
                first_name: "Mael",
                last_name: "Lemire",
                password: "azerty",
                password_confirmation: "azerty",
                code: "" },
              { email: "n@n.com",
                first_name: "Nathan",
                last_name: "Toussaint",
                password: "azerty",
                password_confirmation: "azerty",
                code: "" }])

Category.create!([{ name: "Mobilier" },
                  { name: "Environnement" },
                  { name: "Sanité" },
                  { name: "Culture" },
                  { name: "Solidarité" },
                  { name: "Sport" },
                  { name: "Inclusion" },
                  { name: "Jeunesse" },
                  { name: "Finances" },
                  { name: "Patrimoine" },
                  { name: "Tourisme" },
                  { name: "Autre" }])

30.times do
  Mesure.create!(
    title: Faker::Lorem.sentence(word_count: 5),
    content: Faker::Lorem.sentence,
    category_id: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].sample,
    status: ["En cours de concertation", "Accepté", "Refusé"].sample,
    user_id: (1..User.count).to_a.sample
  )
end

30.times do
  Observation.create!(
    title: Faker::Lorem.sentence,
    location: Faker::Address.city,
    description: Faker::Lorem.paragraph,
    dangerosity: rand(1..5),
    user: User.all.sample,
    category: Category.all.sample
  )
end

100.times do
  Comment.create!(
    content: Faker::Lorem.sentence,
    user: User.all.sample,
    mesure: Mesure.all.sample
  )
end

100.times do
  SubComment.create!(
    content: Faker::Lorem.sentence,
    user: User.all.sample,
    comment: Comment.all.sample
  )
end
