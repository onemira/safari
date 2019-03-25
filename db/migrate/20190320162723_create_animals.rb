class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :species
      t.string :last_seen_location
      t.integer :seen_count

      t.timestamps
    end
  end
end
