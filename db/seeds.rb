require "json"

users_data=JSON.parse(File.read("db/data/users.json"))
tweets_data=JSON.parse(File.read("db/data/tweets.json"))



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

