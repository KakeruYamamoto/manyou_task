# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


50.times do |n|

name = Faker::Name.name
email = Faker::Internet.email
priority = ["高", "中", "低"]
status = ['未着手','着手中','完了']
s1 = Date.parse("2015/01/01")
s2 = Date.parse("2024/01/01")
s = Random.rand(s1 .. s2)

Task.create(
  task_name: name,
  task_content: "ラーメン食べました！#{n}回目",
  priority: "#{priority.sample}",
  deadline: "#{s}",
  status:"#{status.sample}"
)
end
