class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :introduction, length: { maximum: 200 }

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :profile_image

def self.guest
  find_or_create_by!(email: 'guest@guest.com') do |member|
    member.password = SecureRandom.urlsafe_base64
    member.name = 'ゲスト'
    member.nick_name = 'ゲストユーザー'
    end
end


# def active_for_authentication?
#     super && (self.is_deleted == true)
# end

end