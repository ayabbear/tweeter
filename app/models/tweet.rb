class Tweet < ApplicationRecord
  has_many :tweet_tags, dependent: :destroy
  has_many :tags, through: :tweet_tags
  has_many :tweet_mentions, dependent: :destroy
  has_many :mentions, through: :tweet_mentions
  has_many :retweets, class_name: 'Tweet', foreign_key: 'retweet_id'

  validates :body, presence: true, unless: :retweet_id?, length: { maximum: 250}

  belongs_to :user
end
