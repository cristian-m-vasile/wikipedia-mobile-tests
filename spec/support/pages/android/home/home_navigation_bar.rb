module Android
  class HomeNavigationBar
    include PageObject

    def reading_list_element; find_element(accessibility_id: 'My lists') end

    def go_to_reading_lists
      reading_list_element.click
    end
  end
end
