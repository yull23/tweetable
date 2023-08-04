class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.string :body
      t.integer :replies_count, default: 0
      t.integer :likes_count, default: 0
      t.integer :category, default: 0
      t.date :upload_date
      t.date :update_tweet
      t.timestamps
    end
  end
end
