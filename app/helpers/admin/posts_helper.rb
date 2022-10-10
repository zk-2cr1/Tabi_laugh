module Admin::PostsHelper
   def render_with_hashtag(caption)
    caption.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){|word| link_to word, "/admin/hashtag/#{word.delete("#")}"}.html_safe
   end
end
