module Android
  class ReadingListPage
    include PageObject

    list_items(:saved_articles, id: 'org.wikipedia:id/page_list_item_title')
    label(:deleted_article_popup, id: 'org.wikipedia:id/snackbar_text')

    def find_article_by_title(title)
      saved_articles_elements.find { |article| article.text == title }
    end

    def delete_article(title)
      article = find_article_by_title(title)
      MobileHelper::swipe_left(article)
    end
  end
end
