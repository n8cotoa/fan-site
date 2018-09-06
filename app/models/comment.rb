class Comment < ActiveRecord::Base
  has_and_belongs_to_many :posts
  belongs_to :users
end
