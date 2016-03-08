class AddProfilesTable < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :chinesename
      t.string :englishname
      t.string :nickname
      t.integer :gender
      t.date :birthday
      t.string :address
      t.integer :phone

      t.timestamps
    end 
    add_index :profiles , :user_id
  end
end
