class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :animal_class
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
