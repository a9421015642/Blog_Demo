class AddLikesTable < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :article_id
      t.boolean :like_notlike
    end
  end
end
