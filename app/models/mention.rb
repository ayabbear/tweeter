class Mention < ApplicationRecord
  has_many :tweet_mentions
  has_many :tweets, through: :tweet_mentions

  validates :name, presence: true
end
