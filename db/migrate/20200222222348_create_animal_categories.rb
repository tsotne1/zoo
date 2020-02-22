class CreateAnimalCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :animal_categories do |t|
      t.integer :animal_id
      t.integer :article_id

      t.timestamps
    end
  end
end
