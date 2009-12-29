require "spec/expectations"
require "webrat"
require "webrat/selenium"

 
Webrat.configure do |config|
  config.mode = :selenium
  config.selenium_server_address = '127.0.0.1'
  config.selenium_server_port = 4567
  config.application_port = 4567
  config.application_framework = :external
end

class MechanizeWorld < Webrat::MechanizeAdapter
  include Webrat::Methods
  include Webrat::Selenium::Methods
  include Webrat::Selenium::Matchers
  # no idea why we need this but without it response_code is not always recognized
  Webrat::Methods.delegate_to_session :response_code, :response_body
end

World do
  MechanizeWorld.new
end
