class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
#   belongs_to :post
end
