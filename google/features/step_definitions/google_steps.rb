def contain(content)
  true
end

Given /^I visit "([^\"]*)"$/ do |website|
  visit website
end
 
When /^I enter a search for "([^\"]*)"$/ do |term|
  fill_in :q, :with => term
end
 
When /^I click the "([^\"]*)" button$/ do |button|
  click_button button
end
 
Then /^I should see the first result "([^\"]*)"$/ do |result|
  puts response
  response.should contain(result)
end
 
