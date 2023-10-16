require 'faker'
desc "Fill the database tables with some sample data"
task sample_data: :environment do
  starting = Time.now

  if Rails.env.development?
    ActionPlan.delete_all
    Goal.delete_all
    Celebration.delete_all
    Step.delete_all
    User.delete_all
  end

  usernames = Array.new


  10.times do 
    name = Faker::Name.first_name.downcase
    usernames << {
      email: "#{name}@example.com",
      password: "password",
      username: name,
      avatar_url: "https://robohash.org/#{rand(9999)}",
      goals_count: rand(10)
    }
  end

  User.create(usernames)

  users = User.all

  users.each do |user|
    rand(15).times do
        goals = user.goals.create(
        date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
        name: Faker::JapaneseMedia::StudioGhibli.quote,
        priorities: Faker::Games::Overwatch.quote,
        progress: ["complete","incomplete"].sample,
        user_id: user.id
      )
    

    action_plans = goals.action_plans.create(
      date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
      goal_id: goals.id
    )

    action_plans.steps.create(
      name: Faker::Games::Overwatch.hero,
      resources: Faker::Games::Minecraft.item,
      skills: Faker::Games::StreetFighter.move,
      time_allotted: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
      action_plan_id: action_plans.id

    )

    goals.own_celebrations.create(
      activity: Faker::JapaneseMedia::FmaBrotherhood.country,
      date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
      image: "https://robohash.org/#{rand(9999)}"
    )
    end
  end

  ending = Time.now
  p "It took #{(ending - starting).to_i} seconds to create sample data."
  p "There are now #{User.count} users."
  p "There are now #{Goal.count} goals."
  p "There are now #{ActionPlan.count} action plans."
  p "There are now #{Step.count} steps."
  p "There are now #{Celebration.count} celebrations."

end
