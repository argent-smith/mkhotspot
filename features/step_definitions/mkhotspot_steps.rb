Given /^I found "([^"]*)" binary$/ do |arg1|
  system("bundle exec mkhotspot > /dev/null 2>&1").should be_true
end

