class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :grade

      t.timestamps
    end
      add_index :users  , [:name, :password_digest]
  end
end
