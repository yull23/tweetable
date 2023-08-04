class Like < ApplicationRecord
  # Associations
  belongs_to :user, counter_cache: true
  belongs_to :tweet, counter_cache: true
  # Validations
  validates :user_id, uniqueness: {
    scope: :tweet_id,
    message: "should be a unique combination"
  }
end
