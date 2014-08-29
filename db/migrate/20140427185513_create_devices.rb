class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :token
      t.boolean :enabled
      t.string :platform
      t.references :user, index: true
      t.references :company, index: true
      t.timestamps
    end
  end
end
