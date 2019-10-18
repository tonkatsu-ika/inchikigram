class Post < ApplicationRecord

  validates :text, presence: true

  belongs_to :user

  has_many :hashtags, through: :posthashtags
  has_many :posthashtags

  # DBへのコミット直前に実行
  after_create do
    post = Post.find_by(id: self.id)
    hashtags = self.text.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      post.hashtags << tag
    end
  end

    before_update do
      post = Post.find_by(id: self.id)
      post.hashtags.clear
      hashtags = self.text.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
      hashtags.uniq.map do |hashtag|
        tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
        post.hashtags << tag
      end
    end
end
