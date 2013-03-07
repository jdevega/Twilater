class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :tweet_id
      t.integer :user_id
      t.hstore :urls
      t.datetime :created_at
    end

    add_hstore_index :tweets, :urls
  end
end
