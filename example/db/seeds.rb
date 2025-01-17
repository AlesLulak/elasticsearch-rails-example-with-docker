# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  name = Faker::Name.first_name
  last = Faker::Name.last_name
  person = Person.create(
    firstname: name,
    lastname: last,
    excluded: false,
  )

  3.times do
    person.emails.create(email: Faker::Internet.email(name: "#{name} #{last}", separators: "."))
  end

  person.emails.each do |e|
    5.times do
      e.comments.create(content: Faker::Quote.most_interesting_man_in_the_world)
    end
  end
end
