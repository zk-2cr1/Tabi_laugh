class Favorite < ApplicationRecord
  validates_uniqueness_of :post_id, scope: :member_id #validates_uniqueness_ofによって、1人が1つの投稿に対して、1つしかいいねをつけられない

  belongs_to :member
  belongs_to :post

end
