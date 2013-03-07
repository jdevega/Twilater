class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string   :tweet_id
      t.integer   :account_id
      t.hstore    :urls
      t.datetime  :created_at
    end

    add_hstore_index :tweets, :urls
  end
end
