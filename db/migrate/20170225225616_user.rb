class User < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :census_id
      t.string :token
      
      t.timestamps
    end
  end
end
