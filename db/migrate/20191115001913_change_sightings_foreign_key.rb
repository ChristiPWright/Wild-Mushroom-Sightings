class ChangeSightingsForeignKey < ActiveRecord::Migration[5.2]
  def change
    add_column :sightings, :mushroom_id, :integer
    remove_column :sightings, :mushroom_key
  end
    
end
