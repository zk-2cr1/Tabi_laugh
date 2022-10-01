class Post < ApplicationRecord
  belongs_to :member
  belongs_to :category
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_hashtag_relations, dependent: :destroy
  has_many :hashtags, through: :post_hashtag_relations

  has_many_attached :image

  validates :title, presence: true
  validates :body, presence: true

# ブックマーク（いいね）機能
  #ユーザーidがfavoriteテーブル内に存在するかどうかを判別
  def favorited_by?(member)
      favorites.where(member_id: member.id).exists?
  end

# ハッシュタグ機能
  #DBへのコミット直前に実施する
  after_create do
    post = Post.find_by(id: self.id)
    hashtags  = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    post.hashtags = []
    hashtags.uniq.map do |hashtag|
      #ハッシュタグは先頭の'#'を外した上で保存
      tag = Hashtag.find_or_create_by(hashname: hashtag.delete('#'))
      post.hashtags << tag
    end
  end

  before_update do
    post = Post.find_by(id: self.id)
    post.hashtags.clear
    hashtags = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.delete('#'))
      post.hashtags << tag
    end
  end

 # キーワード検索機能
 def self.search_for(keyword,method)
    if method == "perfect"
      Post.where(["title like? OR body like?", "#{keyword}", "#{keyword}"])
    elsif method == "forward"
      Post.where(["title like? OR body like?", "#{keyword}%", "#{keyword}%"])
    elsif method == "backward"
      Post.where(["title like? OR body like?", "%#{keyword}", "%#{keyword}"])
    else
      Post.where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
    end
 end

end