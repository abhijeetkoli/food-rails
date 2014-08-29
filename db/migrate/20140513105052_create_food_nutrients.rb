class CreateFoodNutrients < ActiveRecord::Migration
  def change
    create_table :food_nutrients, :id => false do |t|
      t.integer :id, :options => 'PRIMARY KEY'
      t.string :ndb_no
      t.string :nutrient_no
      t.decimal :value, precision: 10, scale: 3
      t.integer :data_points
      t.decimal :standard_error, precision: 8, scale: 3
      t.string :reference_ndb_no
      t.string :added_nutrient_mark
      t.integer :studies
      t.decimal :minimum_value, precision: 10, scale: 3
      t.decimal :maximum_value, precision: 10, scale: 3
      t.integer :df
      t.decimal :lower_eb, precision: 10, scale: 3
      t.decimal :upper_eb, precision: 10, scale: 3
      t.string :statistical_comments
      t.string :confidence_code
      t.string :source_code
      t.string :derivation_code
      t.references :food, index: true
      t.references :nutrient, index: true
      t.timestamps
    end
  end
end
