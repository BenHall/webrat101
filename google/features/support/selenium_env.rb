require "webrat/selenium"
require File.join(File.dirname(__FILE__), 'cucumber-screenshot')

def get_browser_key()
  command = "*firefox"
  command = ENV['BROWSER'] if ENV['BROWSER']
  cmdIndex = ARGV.index '--browser'
  command = ARGV[cmdIndex + 1] unless cmdIndex.nil?
  return command
end

Webrat.configure do |config|
  config.mode = :selenium
  config.selenium_server_address = '127.0.0.1'
  config.selenium_server_port = 4444
  config.application_port = 4444
  config.application_framework = :external

  config.selenium_browser_key = ENV['browser']
  puts "Executing tests using the browser #{config.selenium_browser_key}"
end

After do |scenario|
  take_screenshot("screenshot-#{Time.new.to_i}") if scenario.failed?
end

class MechanizeWorld < Webrat::MechanizeAdapter
  include ::Screenshots
  include Webrat::Methods
  include Webrat::Selenium::Methods
  include Webrat::Selenium::Matchers
  # no idea why we need this but without it response_code is not always recognized
  Webrat::Methods.delegate_to_session :response_code, :response_body
end