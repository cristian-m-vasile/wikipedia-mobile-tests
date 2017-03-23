module Android
  class ReadingListOnboardingWidget
    include PageObject

    button(:got_it, id: 'org.wikipedia:id/onboarding_button')

    def acknowledge
      got_it_element.when_present.click
    end
  end
end
