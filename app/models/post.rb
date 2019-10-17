class Post < ApplicationRecord

  belongs_to :user

  has_and_belongs_to_many :hashtags

  # DBへのコミット直前に実行
  after_create do
    post = Post.find_by(id: self.id)
    hashtags = self.content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      post.hashtags << tag
    end

    before_update do
      post = Post.find_by(id: self.id)
      post.hashtags.clear
      hashtags = self.content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
      hashtags.uniq.map do |hashtag|
        tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
        post.hashtags << tag
      end

end
