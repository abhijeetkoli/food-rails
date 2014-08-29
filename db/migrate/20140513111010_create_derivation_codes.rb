class CreateDerivationCodes < ActiveRecord::Migration
  def change
    create_table :derivation_codes, :id => false do |t|
      t.integer :id, :options => 'PRIMARY KEY'
      t.string :code
      t.string :description, limit: 1000
      t.timestamps
    end
  end
end
