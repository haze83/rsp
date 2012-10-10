### UTILITY METHODS ###

### GIVEN ###
Given /^the following navigation exists:$/ do |table|
  # table is a Cucumber::Ast::Table
  #pending # express the regexp above with the code you wish you had
end

### WHEN ###
When /^I go to the (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I follow (\w+)$/ do |nav|
  #  pending #visit "/navigations/#{$nav}"
end

### THEN ###
Then /^I should see a list of saved navigations$/ do
  #pending # express the regexp above with the code you wish you had
end

Then /^I should see the content of (\w+)$/ do |nav|
  nav.should match(/[Candles|Gifts]/)
end