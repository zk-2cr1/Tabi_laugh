class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :post

  has_one_attached :image

  validates :body, presence: true

end
