class CreateUserPlants < ActiveRecord::Migration[6.1]
  def change
    create_table :user_plants do |t|
      t.belongs_to :user
      t.belongs_to :plant

      t.timestamps
    end
  end
end
