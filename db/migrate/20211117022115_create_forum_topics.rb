class CreateForumTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :forum_topics do |t|
      t.string :content
      t.string :img_url
      t.string :title

      t.timestamps
    end
  end
end
