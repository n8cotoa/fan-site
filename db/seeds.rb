Post.destroy_all
Comment.destroy_all

25.times do |index|
  Post.create(title: Faker::Superhero.name,
                      description: Faker::FamilyGuy.quote)
end


Post.all.each do |post|
  15.times do |index|
    post.comments.create(comment: Faker::TwinPeaks.quote)
  end
end
