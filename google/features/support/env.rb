require "spec/expectations"
require "webrat"

class MechanizeWorld < Webrat::MechanizeAdapter
end
  
World do
  MechanizeWorld.new
end