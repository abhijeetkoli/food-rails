class CreateFoodDataSources < ActiveRecord::Migration
  def change
    create_table :food_data_sources, :id => false do |t|
      t.integer :id, :options => 'PRIMARY KEY'
      t.string :ndb_no
      t.string :nutrient_no
      t.references :data_source, index: true
      t.references :food, index: true
      t.references :nutrient, index: true
      t.timestamps
    end
  end
end
