class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

def self.guest
  find_or_create_by!(email: 'guest@guest.com') do |member|
    member.password = SecureRandom.urlsafe_base64
    member.first_name = 'ゲスト'
    member.last_name = 'ゲスト'
    member.nick_name = 'サンプル'
  end
end

end
