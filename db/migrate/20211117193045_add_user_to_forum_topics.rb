class AddUserToForumTopics < ActiveRecord::Migration[6.1]
  def change
    add_reference :forum_topics, :user, null: false, foreign_key: true
  end
end
