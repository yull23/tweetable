require "json"
require "faker"

users_data=JSON.parse(File.read("db/data/users.json"))
tweets_data=JSON.parse(File.read("db/data/tweets.json"))


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
    upload_date:Faker::Date.between(from: '2023-07-01', to: '2023-07-14')
  )
  puts "Post Tweet not created. Errors: #{new_post_tweet.errors.full_messages}" unless new_post_tweet.save
  
  # Creation of reply Tweet.
  tweets_replies_data=tweet_data["replies"]

  tweets_replies_data.each do |tweet_reply|
    new_reply_tweet=Tweet.new(
      user:User.all.sample,
      body:tweet_reply,
      category:1,
      replied_to:new_post_tweet,
      upload_date:Faker::Date.between(from: '2023-07-15', to: '2023-07-31')
    )
    puts "Reply Tweet not created. Errors: #{new_reply_tweet.errors.full_messages}" unless new_reply_tweet.save
  end
end






# # Creating users
# 5.times do
#   User.create
# end
# users=User.all[0..4]

# ## Main tweets creation
# 5.times do
#   tweet=Tweet.create(user:users.sample)
# end
# main_tweets=Tweet.all[0..4]

# ## Secundary tweets creation
# 10.times do
#   tweet=Tweet.create(user:users.sample, replied_to:main_tweets.sample)
# end

# ## Creating likes for tweets
# 50.times do
#   like=Like.create(user:users.sample, tweet:Tweet.all.sample)
# end

# p Like.count, User.count, Tweet.count









# # Seeding data, without validations

# Like.destroy_all
# Tweet.destroy_all
# User.destroy_all

# # Creating users
# 5.times do
#   User.create
# end
# users=User.all[0..4]

# ## Main tweets creation
# 5.times do
#   tweet=Tweet.create(user:users.sample)
# end
# main_tweets=Tweet.all[0..4]

# ## Secundary tweets creation
# 10.times do
#   tweet=Tweet.create(user:users.sample, replied_to:main_tweets.sample)
# end

# ## Creación de likes para tweets
# 50.times do
#   like=Like.create(user:users.sample, tweet:Tweet.all.sample)
# end

# p Like.count, User.count, Tweet.count

