class AddRetweetToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :retweet_id, :bigInt
  end
end
