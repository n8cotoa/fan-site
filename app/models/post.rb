class Post < ActiveRecord::Base
  validates :title, :description, :presence => true
  has_and_belongs_to_many :comments
  belongs_to :user
  
  def self.get_scope(sort_value)
    if sort_value == 'title'
      self.sort_alpha
    elsif sort_value == 'date'
      self.sort_date
    else
      self.all
    end
  end

  scope :sort_alpha, -> {(
    select("posts.id, posts.title, posts.avg_rating")
    .order("lower(posts.title) ASC")
    )}

  scope :sort_date, -> {(
    select("posts.id, posts.title, posts.created_at, posts.avg_rating")
    .order("posts.created_at DESC")
    )}

  def post_rating(rating)
    number = rating.to_i
    ratings.push(number)
    avg_rating = (ratings.reduce(:+)/ratings.length)
    return [ratings, avg_rating]
  end

end
