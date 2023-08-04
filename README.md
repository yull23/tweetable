# README

## Descripción de Modelos

1. Like

   A user X makes the "Like" reaction to a tweet.

   Attributes:

   ```
   t.bigint "tweet_id"
   t.bigint "user_id"
   ```

   Associations:

   The number of Likes must be counted for each tweet, and each Like comes from a User, and is directed to a Tweet.

   ```
   belongs_to :user, counter_cache: true
   belongs_to :tweet, counter_cache: true
   ```

   Validations, Callbacks and Query Interface:

   The combination between the User_id and Tweet_id must be unique.

   ```
   validates :user_id, uniqueness: {
     scope: :tweet_id,
     message: "should be a unique combination"
   }
   ```

2. User

   Each user can create Tweets, and make Likes.

   Attributes:

   - email cannot be blank, must be in email format and unique
   - username cannot be blank and must be unique
   - the name cannot be blank
   - avatar If the user does not provide an image, a placeholder image should be used by default.
   - password, password of the user.
   - role is the role that a user assumes, this grants him the necessary permissions.
   - upload_date, represents the user creation date.
     -likes_count, counts the number of likes that a user has made
     -tweets_count, counts the number of tweets a user has created

   Associations:

   A user can make many likes and create many tweets.

   ```
   has_many :tweets, dependent: :destroy
   has_many :likes, dependent: :destroy
   ```

## Data creation

An initial model was proposed for the creation of data, these must be verified so that, as a result of these, the validations are carried out:

```
# Seeding data, without validations

Like.destroy_all
Tweet.destroy_all
User.destroy_all

# Creating users

5.times do
  User.create
end
users=User.all[0..4]

## Main tweets creation

5.times do
  tweet=Tweet.create(user:users.sample)
end
main_tweets=Tweet.all[0..4]

## Secundary tweets creation

10.times do
  tweet=Tweet.create(user:users.sample, replied_to:main_tweets.sample)
end

## Creación de likes para tweets

50.times do
  like=Like.create(user:users.sample, tweet:Tweet.all.sample)
end
p Like.count, User.count, Tweet.count
```

## Generación de controladores
