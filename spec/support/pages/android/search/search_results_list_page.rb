module Android
  class SearchResultsListPage
    include PageObject

    unordered_list(:search_results_list, id: 'org.wikipedia:id/search_results_list')
    list_items(:search_results_items, id: 'org.wikipedia:id/page_list_item_title')

    def go_to_first_result
      search_results_items_elements.first.when_present.click
    end
  end
end
