class Hashtag < ApplicationRecord
  validates :hashname, uniqueness: true, length: { maximum:99}
  has_many :post_hashtag_relations, dependent: :destroy
  has_many :posts, through: :post_hashtag_relations
end