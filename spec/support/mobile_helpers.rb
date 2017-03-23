module MobileHelper
  def self.swipe_left(element)
    Appium::TouchAction.new.swipe(
      start_x: element.location.x,
      start_y: element.location.y,
      end_x: 0.2*element.location.x,
      end_y: element.location.y).perform
  end
end
