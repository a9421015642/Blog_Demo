class Categories_article < ActiveRecord::Base
  belongs_to :article
  belongs_to :category
end