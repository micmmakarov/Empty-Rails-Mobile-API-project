class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :company_id
      t.string :token1

      t.timestamps
    end
  end
end
