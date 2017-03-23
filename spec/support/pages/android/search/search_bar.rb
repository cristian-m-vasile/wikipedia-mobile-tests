module Android
  class SearchBar
    include PageObject

    button(:search_bar, id: 'org.wikipedia:id/search_container')
    text_field(:search_text_field, id: 'org.wikipedia:id/search_src_text')
    link(:search_suggestion, id: 'org.wikipedia:id/search_suggestion')

    def search_for(text)
      search_bar_element.when_present.click
      search_text_field_element.when_present.send_keys text
    end

    def go_to_suggestion
      search_suggestion_element.when_present.click
    end
  end
end
