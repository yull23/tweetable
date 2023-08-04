class Tweet < ApplicationRecord
  # Associations between models
  belongs_to :user, counter_cache: true
  has_many :likes, dependent: :destroy
  # Relation Self.Join
  has_many :replies, class_name: "Tweet",
                     foreign_key: "replied_to_id",
                     dependent: :destroy,
                     inverse_of: "replied_to"
  belongs_to :replied_to, class_name: "Tweet", optional: true, counter_cache: :replies_count

  ##
  # Callbacks
  before_validation :set_upload_date, on: :create
  after_save :set_update_tweet

  private

  def set_upload_date
    self.upload_date ||= Date.current if new_record? || upload_date.blank?
    self.update_tweet = self.upload_date
  end

  def set_update_tweet
    return unless saved_change_to_body?

    self.update_tweet = Date.current
  end
end
