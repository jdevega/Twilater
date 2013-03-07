class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :media
      t.string :url
      t.text :content
      t.integer :tweet_id

      t.timestamps
    end
  end
end
