Post.destroy_all
Comment.destroy_all
User.destroy_all

60.times do |index|
  User.create(username: Faker::Name.name_with_middle,
    password: "password")
end

25.times do |index|
  pick = [Faker::TwinPeaks.quote, Faker::Dune.quote, Faker::BojackHorseman.quote, Faker::GreekPhilosophers.quote]
  Post.create(title: Faker::Superhero.name,
                      description: pick.sample,
                    user_id: User.all.shuffle[0].id)
end


Post.all.each do |post|
  15.times do |index|
    post.comments.create(comment: Faker::Lorem.sentence(8),
    user_id: User.all.shuffle[0].id)
  end
end
