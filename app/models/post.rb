class Post < ApplicationRecord
  belongs_to :member
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
  has_many :world_posts, dependent: :destroy
  has_many :wolrds, through: :world_posts

  has_one_attached :image

end
