module Android
  class ReadingListsPage
    include PageObject

    list_items(:reading_lists, id: 'org.wikipedia:id/item_title')

    def open_first_list
      reading_lists_elements.first.when_present.click
    end
  end
end
