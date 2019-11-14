class CreateMushrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :mushrooms do |t|
      t.string :common_name
      t.string :species
      t.string :genus

      t.timestamps
    end
  end
end
