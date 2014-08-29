class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights, :id => false do |t|
      t.integer :id, :options => 'PRIMARY KEY'
      t.string :ndb_no
      t.string :sequence
      t.decimal :amount, precision: 5, scale: 3
      t.string :description
      t.decimal :gram_weight, precision: 7, scale: 1
      t.integer :data_points
      t.decimal :standard_deviation, precision: 7, scale: 3
      t.references :food, index: true
      t.timestamps
    end
  end
end
