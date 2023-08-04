class AddReferencesInSeveralColumns < ActiveRecord::Migration[7.0]
  def change
    add_reference :tweets, :user, foreign_key:true
    add_reference :tweets, :replied_to, foreign_key: {to_table: :tweets}
    add_reference :likes, :tweet, foreign_key:true
    add_reference :likes, :user, foreign_key:true
  end
end
