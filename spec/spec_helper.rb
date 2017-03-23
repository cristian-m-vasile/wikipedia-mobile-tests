require 'rubygems'
require 'pry'
require 'appium_lib'
require 'page-object'
require 'faker'
require 'require_all'

require_rel 'support'

TIMEOUT = ENV['TIMEOUT'] || 20
PLATFORM = ENV['PLATFORM'].downcase
VERSION = ENV['VERSION']
DEVICE = ENV['DEVICE'].capitalize
APP_PATH = ENV['APP_PATH']

def promote_appium_methods
  Appium.promote_appium_methods RSpec::Core::ExampleGroup
  Appium.promote_appium_methods PageObject
end

RSpec.configure do |config|
  config.include PageObject::PageFactory

  PageObject.default_element_wait = TIMEOUT
  PageObject.default_page_wait = TIMEOUT
  config.color = true
  config.full_backtrace = true

  config.before(:all) do
    case PLATFORM
    when 'android'
      options = {
        caps: {
          :platformName => PLATFORM.capitalize,
          :platformVersion => VERSION,
          :deviceName => DEVICE,
          :avd => PLATFORM,
          :app => APP_PATH,
          :noReset => false,
          :fullReset => false,
          :newCommandTimeout => 600,
          :disableAndroidWatchers => true
        },
        launchTimeout: 200000,
      }
    when 'ios'
      raise "Not implemented yet."
    else
      raise "Only Android and iOS platforms supported."
    end

    @browser = Appium::Driver.new(options).start_driver
    promote_appium_methods
  end

  config.after(:all) do
    @browser.quit unless @browser.nil?
  end
end
