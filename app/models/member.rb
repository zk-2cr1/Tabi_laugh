class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :introduction, length: { maximum: 200 }
  validates :name, presence: true
  validates :nick_name, presence: true

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :profile_image

  scope :only_active, -> { where(is_deleted: true) }

def self.guest
  find_or_create_by!(email: 'guest@guest.com') do |member|
    member.password = SecureRandom.urlsafe_base64
    member.name = 'ゲスト'
    member.nick_name = 'ゲストユーザー'
    end
end

#ログイン時に退会済みのユーザーが同じアカウントでログインできないように制約
def active_for_authentication?
    super && (self.is_deleted == false)   #is_deletedがtrueならfalseを返すようにしている
end

def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank? 
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
end
  
end