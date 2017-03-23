module Android
  class ArticlePage
    include PageObject

    paragraph(:article_title, id: 'org.wikipedia:id/view_page_title_text')
  end
end
