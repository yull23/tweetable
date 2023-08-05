class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.string :body
      t.integer :replies_count, default: 0
      t.integer :likes_count, default: 0
      t.integer :category, default: 0
      t.datetime :upload_date
      t.datetime :update_tweet
      t.timestamps
    end
  end
end
