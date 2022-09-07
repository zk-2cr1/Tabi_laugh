class World < ApplicationRecord
  belongs_to :genre
  has_many :world_posts, dependent: :destroy
  has_many :posts, through: :world_posts

  has_one_attached :image

end
