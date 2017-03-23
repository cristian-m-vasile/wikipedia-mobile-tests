module Android
  class ArticleNavigationBar
    include PageObject

    def save_to_reading_list_element; find_element(accessibility_id: 'Add this article to a reading list') end

    def add_to_reading_list
      save_to_reading_list_element.click
    end
  end
end
