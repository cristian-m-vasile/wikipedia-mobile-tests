module Android
  class ReadingListCreateWidget
    include PageObject
    
    button(:ok, id: 'android:id/button1')
    button(:cancel, id: 'android:id/button2')

    def create_list
      ok_element.when_present.click
    end
  end
end
