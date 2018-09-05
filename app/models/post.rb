class Post < ActiveRecord::Base
  validates :title, :description, :presence => true

  scope :sort_alpha, -> {(
    select("posts.id, posts.title")
    .order("lower(posts.title) ASC")
    )}

  scope :sort_date, -> {(
    select("posts.id, posts.title, posts.created_at")
    .order("posts.created_at DESC")
    )}

end
