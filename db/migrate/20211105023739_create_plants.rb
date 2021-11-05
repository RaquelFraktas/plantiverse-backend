class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :alt_name
      t.string :img_url
      t.string :origin
      t.text :description

      t.timestamps
    end
  end
end
