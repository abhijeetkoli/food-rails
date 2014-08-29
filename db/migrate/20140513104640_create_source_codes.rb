class CreateSourceCodes < ActiveRecord::Migration
  def change
    create_table :source_codes, :id => false do |t|
      t.integer :id, :options => 'PRIMARY KEY'
      t.string :description
      t.timestamps
    end
  end
end
