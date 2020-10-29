class TweetMention < ApplicationRecord
  belongs_to :mention
  belongs_to :tweet
end
