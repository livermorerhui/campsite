# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "自动创建2个user账号"

create_account = User.create([email: 'ceshi@qq.com', password: '111111', password_confirmation: '111111'])
create_account = User.create([email: 'ceshi2@qq.com', password: '111111', password_confirmation: '111111'])
puts "user account created."
###############################################################################################################################################################################################################################

create_jos = for i in 1..2 do
  Mission.create!([title: "Mission no.#{i}", description: "自动建立第 #{i} 個Public任务", location: "东莞 #{i}", contact_email: "ceshi@qq.com", user_id: "1", is_hidden: "false"])
end
puts "2 Public missions created."

create_jos = for i in 1..3 do
  Job.create!([title: "Job no.#{i}", description: "自动建立第 #{i} 個Public工作", people: rand(1..20),wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, mission_id: "1", user_id: "1", is_hidden: "false"])
end
puts "3 Public jobs created."

create_jos = for i in 4..6 do
  Job.create!([title: "Job no.#{i}", description: "自动建立第 #{i} 個Hidden工作", people: rand(1..20),wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, mission_id: "1", user_id: "1", is_hidden: "true"])
end
puts "3 Hidden jobs created."

create_jos = for i in 7..9 do
  Job.create!([title: "Job no.#{i}", description: "自动建立第 #{i} 個Public工作", people: rand(1..20),wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, mission_id: "2", user_id: "1", is_hidden: "false"])
end
puts "3 Public jobs created."

create_jos = for i in 10..12 do
  Job.create!([title: "Job no.#{i}", description: "自动建立第 #{i} 個Hidden工作", people: rand(1..20),wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, mission_id: "2", user_id: "1", is_hidden: "true"])
end
puts "3 Hidden jobs created."
# user1 有 2个公开mission，分别有 3个公开job 和 3个隐藏job
#########################################################################################
create_jos = for i in 3..4 do
  Mission.create!([title: "Mission no.#{i}", description: "自动建立第 #{i} 個Public任务", location: "东莞 #{i}", contact_email: "ceshi@qq.com", user_id: "1", is_hidden: "ture"])
end
puts "2 Hidden missions created."

create_jos = for i in 13..15 do
  Job.create!([title: "Job no.#{i}", description: "自动建立第 #{i} 個Public工作", people: rand(1..20),wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, mission_id: "3", user_id: "1", is_hidden: "false"])
end
puts "3 Public jobs created."

create_jos = for i in 16..18 do
  Job.create!([title: "Job no.#{i}", description: "自动建立第 #{i} 個Hidden工作", people: rand(1..20),wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, mission_id: "3", user_id: "1", is_hidden: "true"])
end
puts "3 Hidden jobs created."

create_jos = for i in 19..21 do
  Job.create!([title: "Job no.#{i}", description: "自动建立第 #{i} 個Public工作", people: rand(1..20),wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, mission_id: "4", user_id: "1", is_hidden: "false"])
end
puts "3 Public jobs created."

create_jos = for i in 22..24 do
  Job.create!([title: "Job no.#{i}", description: "自动建立第 #{i} 個Hidden工作", people: rand(1..20),wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, mission_id: "4", user_id: "1", is_hidden: "true"])
end
puts "3 Hidden jobs created."
# user1 有 2个隐藏mission，分别有 3个公开job 和 3个隐藏job

###############################################################################################################################################################################################################################

create_jos = for i in 5..6 do
  Mission.create!([title: "Mission no.#{i}", description: "自动建立第 #{i} 個Public任务", location: "东莞 #{i}", contact_email: "ceshi2@qq.com", user_id: "2", is_hidden: "false"])
end
puts "2 Public missions created."

create_jos = for i in 25..27 do
  Job.create!([title: "Job no.#{i}", description: "自动建立第 #{i} 個Public工作", people: rand(1..20),wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, mission_id: "5", user_id: "2", is_hidden: "false"])
end
puts "3 Public jobs created."

create_jos = for i in 28..30 do
  Job.create!([title: "Job no.#{i}", description: "自动建立第 #{i} 個Hidden工作", people: rand(1..20),wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, mission_id: "5", user_id: "2", is_hidden: "true"])
end
puts "3 Hidden jobs created."

create_jos = for i in 31..33 do
  Job.create!([title: "Job no.#{i}", description: "自动建立第 #{i} 個Public工作", people: rand(1..20),wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, mission_id: "6", user_id: "2", is_hidden: "false"])
end
puts "3 Public jobs created."

create_jos = for i in 34..36 do
  Job.create!([title: "Job no.#{i}", description: "自动建立第 #{i} 個Hidden工作", people: rand(1..20),wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, mission_id: "6", user_id: "2", is_hidden: "true"])
end
puts "3 Hidden jobs created."
# user2 有 2个公开mission，分别有 3个公开job 和 3个隐藏job
#########################################################################################
create_jos = for i in 7..8 do
  Mission.create!([title: "Mission no.#{i}", description: "自动建立第 #{i} 個Public任务", location: "东莞 #{i}", contact_email: "ceshi2@qq.com", user_id: "2", is_hidden: "ture"])
end
puts "2 Hidden missions created."

create_jos = for i in 37..39 do
  Job.create!([title: "Job no.#{i}", description: "自动建立第 #{i} 個Public工作", people: rand(1..20),wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, mission_id: "7", user_id: "2", is_hidden: "false"])
end
puts "3 Public jobs created."

create_jos = for i in 40..42 do
  Job.create!([title: "Job no.#{i}", description: "自动建立第 #{i} 個Hidden工作", people: rand(1..20),wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, mission_id: "7", user_id: "2", is_hidden: "true"])
end
puts "3 Hidden jobs created."

create_jos = for i in 43..45 do
  Job.create!([title: "Job no.#{i}", description: "自动建立第 #{i} 個Public工作", people: rand(1..20),wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, mission_id: "8", user_id: "2", is_hidden: "false"])
end
puts "3 Public jobs created."

create_jos = for i in 46..48 do
  Job.create!([title: "Job no.#{i}", description: "自动建立第 #{i} 個Hidden工作", people: rand(1..20),wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, mission_id: "8", user_id: "2", is_hidden: "true"])
end
puts "3 Hidden jobs created."
# user2 有 2个隐藏mission，分别有 3个公开job 和 3个隐藏job

###############################################################################################################################################################################################################################
