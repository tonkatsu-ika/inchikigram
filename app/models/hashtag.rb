class Hashtag < ApplicationRecord
  validates :hashname, presence: true, length: {maximum:99}


  has_many :posts, through: :posthashtags
  has_many  :posthashtags

end

