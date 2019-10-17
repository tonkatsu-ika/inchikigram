class CreatePostsHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :posts_hashtags, id: false do |t|
      t.references :post, index: true, foreign_key: true
      t.references :hashtag, index: true, foreign_key: true
    end
  end
end
