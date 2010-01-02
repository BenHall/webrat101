require "spec/expectations"
require "webrat"
require 'cucumber/cli/options'

class MechanizeWorld < Webrat::MechanizeAdapter
end

World do
  MechanizeWorld.new
end

def empty_database()
  #puts "We could do whatever... ;)"
end

Before do
  empty_database
end
 
at_exit do
  empty_database
end