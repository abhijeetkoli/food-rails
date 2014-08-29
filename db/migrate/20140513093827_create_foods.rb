class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods, :id => false do |t|
      t.integer :id, :options => 'PRIMARY KEY'
      t.string :ndb_no
      t.string :food_group_code
      t.string :long_description
      t.string :short_description
      t.string :common_name
      t.string :company_name
      t.string :survey
      t.string :refuse_description
      t.decimal :refuce
      t.string :scientific_name
      t.decimal :nitrogen_factor, precision: 4, scale: 2
      t.decimal :protein_factor, precision: 4, scale: 2
      t.decimal :fat_factor, precision: 4, scale: 2
      t.decimal :cho_factor, precision: 4, scale: 2
      t.references :food_group, index: true
    end
  end
end
