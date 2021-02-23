class AddChallengeRefToChatroom < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :challenge, null: false, foreign_key: true
  end
end
