class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :table_animals do |t|
      t.string :common_name
      t.integer :taxon_id
      # only seed animals that have images/notes
    end
  end
end
