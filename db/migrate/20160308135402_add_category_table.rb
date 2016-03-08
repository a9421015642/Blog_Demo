class AddCategoryTable < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title

      t.timestamps
    end

    create_table :categories_article do |t|
      t.integer :article_id
      t.integer :category_id

      t.timestamps
    end
  end
end
