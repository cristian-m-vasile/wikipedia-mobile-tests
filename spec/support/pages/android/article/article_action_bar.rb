module Android
  class ArticleActionBar
    include PageObject

    def close_article_element; find_element(accessibility_id: 'Navigate up') end

    def close_article
      close_article_element.click
    end
  end
end
