class CreateNutrients < ActiveRecord::Migration
  def change
    create_table :nutrients, :id => false do |t|
      t.integer :id, :options => 'PRIMARY KEY'
      t.string :nutrient_no
      t.string :units
      t.string :tag_name
      t.string :descritpion
      t.string :decimal_places
      t.integer :sr_order
      t.timestamps
    end
  end
end
