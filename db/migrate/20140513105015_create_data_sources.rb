class CreateDataSources < ActiveRecord::Migration
  def change
    create_table :data_sources, :id => false do |t|
      t.integer :id, :options => 'PRIMARY KEY'
      t.integer :nutrient_no
      t.string :source_id
      t.references :food
      t.references :nutrient
      t.string :authors
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
