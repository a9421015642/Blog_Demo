module ApplicationHelper
  def  find_article_category_count(category_id)
    articles = Article.where(category_id: category_id)
    articles.count
  end
end
