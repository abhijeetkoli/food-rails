class CreateFoodGroups < ActiveRecord::Migration
  def change
    create_table :food_groups, :id => false do |t|
      t.integer :id, :options => 'PRIMARY KEY'    
      t.string :description
    end    
  end
end
