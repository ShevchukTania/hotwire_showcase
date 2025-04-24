p "Seeding ..."
p "Seeding Projects"

100.times do
  start_date = Faker::Date.between(from: 1.year.ago, to: Date.today)
  end_date = Faker::Date.between(from: start_date, to: 1.year.from_now)

  Project.create!(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph(sentence_count: 5),
    status: Project.statuses.keys.sample,
    start_date: start_date,
    end_date: end_date
  )
end


p "Projects seeded, Projects Count: #{Project.count}"
p "Done Seeding!"
