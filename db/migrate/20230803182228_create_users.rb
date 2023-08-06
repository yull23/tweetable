class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      # t.string :email
      t.string :username
      t.string :name
      t.string :password_digest
      t.integer :role, default: 0
      t.integer :tweets_count, default: 0
      t.integer :likes_count, default: 0
      t.date :upload_date
      t.timestamps
    end
  end
end
