class Post < ApplicationRecord
  belongs_to :member
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_hashtag_relations, dependent: :destroy
  has_many :hashtags, through: :post_hashtag_relations
  has_many :world_posts, dependent: :destroy
  has_many :wolrds, through: :world_posts
  has_many :categories, dependent: :destroy

  has_one_attached :image

  def favorited?(member)
      favorites.where(member_id: member.id).exists?
  end

# ハッシュタグ機能
# DBへのコミット直前に実施する
  after_create do
    post = Post.find_by(id: self.id)
    hashtags  = self.body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
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
    hashtags = self.body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
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