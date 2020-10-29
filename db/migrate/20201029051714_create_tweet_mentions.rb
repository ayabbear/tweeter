class CreateTweetMentions < ActiveRecord::Migration[6.0]
  def change
    create_table :tweet_mentions do |t|
      t.references :tweet, foreign_key: true
      t.references :mention, foreign_key: true

      t.timestamps
    end
  end
end
