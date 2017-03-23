# wikipedia-app-tests
A testing framework for Wikipedia mobile apps.

### Overview
This is a testing framework with a test suite of acceptance tests for Wikipedia mobile app. Written in Ruby, powered by Appium and Watir WebDriver, run by RSpec.

_**Note:** currently it supports only Android system run on emulator._

### Requirements
* [rvm](https://rvm.io/rvm/install)
* Android SDK (for Android 4.2+)
* gradle

### Installation
* node: ```brew install node```
* ant: ```brew install ant```
* appium: ```npm install -g appium```
* ruby 2.3.0: ```rvm install 2.3.0```
* bundler: ```gem install bundler```

### Setup
1. Go to the main directory
2. Build gems dependencies ```bundle install```

### Running
1. Start Appium server ```$> appium```
2. Start Android emulator ```$> emulator @android```
3. To run the tests:
```
APP_PATH=/Absolute/Path/To/The/App/File
PLATFORM=[ANDROID|IOS]
VERSION=[Platform version, i.e. ”7.0”]
DEVICE=[Device name, i.e. "Nexus 7"]
rspec spec/main_spec.rb
```

### Design decisions
Framework bases on well-known [Page Object pattern](http://docs.seleniumhq.org/docs/06_test_design_considerations.jsp#page-object-design-pattern) that allows to extract into classes the attributes and action-performing functions on defined pages. Written in Behaviour-Driven Development approach with [RSpec](http://rspec.info) allows to validate functionality with acceptance tests. Powered by widely supported open-source [Appium](http://appium.io) dedicated for mobile apps testing that handles multiple platforms basing on [Selenium WebDriver](http://www.seleniumhq.org/projects/webdriver/). Finally, dyniamically-typed [Ruby](https://www.ruby-lang.org/en/) language helps with rapid prototyping and greatly integrates with other frameworks.

### Concerns
* using accessors by name (accessibility_id) is never a good idea - for example this may easily break on language change
* PageObject (v1.2.2) gem used in the solution is not the newest one as v2+ caused a lot of compatibility problems between Appium and PageObject due to different WebDriver approach (Selenium vs. Watir)
* in current approach responsibilities are not much encapsulated among where the test makes an action and where it verifies the result

### Future ideas
* drop Page Object pattern in favour of [Journey/Screenplay](https://dzone.com/articles/page-objects-refactored-solid-steps-to-the-screenp)  to separate responsibilities of tasks from actions and validations (aim, act, verify)
* implement iOS testing framework
* add support for running on real devices
