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

p "Seeding link types"
TaskLinkType.find_or_create_by!(
  name: TaskLinkType::PARENT_CHILD,
  source_relationship: 'is parent of',
  target_relationship: 'is child of'
)

TaskLinkType.find_or_create_by!(
  name: TaskLinkType::BLOCKS,
  source_relationship: 'blocks',
  target_relationship: 'is blocked by'
)

TaskLinkType.find_or_create_by!(
  name: TaskLinkType::RELATES_TO,
  source_relationship: 'relates to',
  target_relationship: 'relates to'
)

p "Seeded link types"

p "Seeding tasks ..."
Project.all.each do |project|
  15.times do
    parent_task = Task.create!(
      name: Faker::Commerce.product_name,
      description: 'This is a parent task',
      due_date: 2.weeks.from_now,
      project: project
    )

    child_task = Task.create!(
      name: Faker::Commerce.product_name,
      description: 'This is a child task',
      due_date: 1.week.from_now,
      project: project
    )

    TaskLink.create!(
      source_task: parent_task,
      target_task: child_task,
      link_type: TaskLinkType.find_by!(name: TaskLinkType::PARENT_CHILD)
    )
  end
end

p "Tasks seeded, Tasks Count: #{Task.count}"

p "Done Seeding!"
