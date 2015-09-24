class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.integer :taxon_id
      # only seed animals that have images/notes
    end
  end
end
