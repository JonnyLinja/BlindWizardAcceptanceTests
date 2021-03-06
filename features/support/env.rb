# This file provides setup and common functionality across all features.  It's
# included first before every test run, and the methods provided here can be 
# used in any of the step definitions used in a test.  This is a great place to
# put shared data like the location of your app, the capabilities you want to
# test with, and the setup of selenium.

require 'rspec/expectations'
require 'appium_lib'
require 'cucumber/ast'
require_relative 'requires.rb'

# Create a custom World class so we don't pollute `Object` with Appium methods
class AppiumWorld
end

# Load the desired configuration from appium.txt, create a driver then
# Add the methods to the world
# if ENV['IDEVICENAME']=='ipad simulator'
# 	caps = Appium.load_appium_txt file: File.expand_path("./../ipadsim/appium.txt", __FILE__), verbose: true
# elsif ENV['IDEVICENAME']=='iphone simulator'
# 	caps = Appium.load_appium_txt file: File.expand_path("./../iphonesim/appium.txt", __FILE__), verbose: true
# else
caps = Appium.load_appium_txt file: File.expand_path('./', __FILE__), verbose: true
# end
Appium::Driver.new(caps)
Appium.promote_singleton_appium_methods Pages
Appium.promote_appium_methods AppiumWorld

World do
  AppiumWorld.new
end

Before { $driver.start_driver }
After { $driver.driver_quit }
