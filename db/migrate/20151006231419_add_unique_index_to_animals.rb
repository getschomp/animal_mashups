class AddUniqueIndexToAnimals < ActiveRecord::Migration
  def change
    add_index(:animals, [:name, :taxon_id], unique: true)
    change_column_null(:animals, :name, false)
  end
end
