Webrat.configure do |config|
  config.mode = :mechanize
end

class MechanizeWorld < Webrat::MechanizeAdapter
  include Webrat::Matchers
  include Webrat::Methods
  # no idea why we need this but without it response_code is not always recognized
  Webrat::Methods.delegate_to_session :response_code, :response
end
