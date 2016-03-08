class AddProlfilesTable < ActiveRecord::Migration
  def change
    create_table :prolfiles do |t|
      t.integer :user_id
      t.string :chinesname
      t.string :englishname
      t.string :nickname
      t.integer :gender
      t.date :birthday
      t.string :address
      t.integer :phone

      t.timestamps
    end 
    add_index :prolfiles , :user_id
  end
end
