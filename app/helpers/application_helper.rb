module ApplicationHelper
  def  find_article_category_current_count(category)
    articles = Article.where(category_id: category.id, user_id: current_user.id)
    articles.count
  end
  def  find_article_category_count(category)
    articles = Article.where(category_id: category.id)
    articles.count
  end

  def   destroy_table_data(table , model)
    @destroy_article = table.where(article_id: model.id)
  end
end
