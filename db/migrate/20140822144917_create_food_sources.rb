class CreateFoodSources < ActiveRecord::Migration
  def change
    create_table :food_sources, :id => false do |t|
      t.integer :id, :options => 'PRIMARY KEY'
      t.integer :source_id
      t.text :authors
      t.string :title
      t.string :year
      t.string :journal
      t.string :volume_city
      t.string :issue_state
      t.string :start_page
      t.string :end_page

      t.timestamps
    end
  end
end
