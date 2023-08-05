require "json"
require "faker"

users_data=JSON.parse(File.read("db/data/users.json"))
tweets_data=JSON.parse(File.read("db/data/tweets.json"))
tweets_replies_data=JSON.parse(File.read("db/data/bodies_tweets.json"))


# Seeding data, without validations

Like.destroy_all
Tweet.destroy_all
User.destroy_all

# User Creation
users_data.each do |user_data|
  new_user=User.new(user_data)
  puts "User not created. Errors: #{new_user.errors.full_messages}" unless new_user.save

end

# Tweet creation

tweets_data.each do |tweet_data|
  # Post Tweet Creation
  new_post_tweet=Tweet.new(
    user:User.all.sample,
    body:tweet_data["body"],
    upload_date:Faker::Time.between(from: '2023-07-01', to: '2023-07-14')
  )
  puts "Post Tweet not created. Errors: #{new_post_tweet.errors.full_messages}" unless new_post_tweet.save
  
  # Creation of reply Tweet.
  tweets_replies_data=tweet_data["replies"]
  start_date = Time.utc(2023, 7, 1)
  end_date = Time.utc(2023, 7, 31)
  tweets_replies_data.each do |tweet_reply|
    new_reply_tweet=Tweet.new(
      user:User.all.sample,
      body:tweet_reply,
      category:1,
      replied_to:new_post_tweet,
      upload_date:Time.at(rand(start_date..end_date))
    )
    puts "Reply Tweet not created. Errors: #{new_reply_tweet.errors.full_messages}" unless new_reply_tweet.save
  end
end

tweets_current=Tweet.all

# Tweets_replies creation

50.times do
  start_date = Time.utc(2023, 8, 1)
  end_date = Time.utc(2023, 8, 4)
  new_tweet=Tweet.new(
    user:User.all.sample,
    body:tweets_replies_data.sample,
    category:1,
    replied_to:tweets_current.sample,
    upload_date:Time.at(rand(start_date..end_date))
  )
  puts "New Tweet replies not created. Errors: #{new_tweet.errors.full_messages}" unless new_tweet.save
end

# Like creation

50.times do
  like=Like.create(user:User.all.sample, tweet:Tweet.all.sample)
end


users=User.all

users.each do |user|
  index_img=user.id
  user.avatar.attach(io:File.open("db/images/user_#{index_img}.jpeg"),filename:"avatar user_#{index_img}")
  p user.avatar.attached?
end






# # # Creating users
# # 5.times do
# #   User.create
# # end
# # users=User.all[0..4]

# # ## Main tweets creation
# # 5.times do
# #   tweet=Tweet.create(user:users.sample)
# # end
# # main_tweets=Tweet.all[0..4]

# # ## Secundary tweets creation
# # 10.times do
# #   tweet=Tweet.create(user:users.sample, replied_to:main_tweets.sample)
# # end

# # ## Creating likes for tweets
# # 50.times do
# #   like=Like.create(user:users.sample, tweet:Tweet.all.sample)
# # end

# # p Like.count, User.count, Tweet.count

