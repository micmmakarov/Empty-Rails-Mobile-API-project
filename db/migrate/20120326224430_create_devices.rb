class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.string :phonegap
      t.string :platform
      t.string :uuid
      t.string :version
      t.references :user

      t.timestamps
    end
    add_index :devices, :user_id
  end
end
