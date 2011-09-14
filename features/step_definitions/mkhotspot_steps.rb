Given /^I found "([^"]*)" binary$/ do |arg1|
  system("bundle exec mkhotspot").should be_true
end

When /^I run it with "([^"]*)" parameter$/ do |hs_name|
  @hs_name = hs_name
  (@output = `bundle exec mkhotspot #{hs_name}`).should_not be_empty
end

Then /^I should see the progress messages$/ do
  @output.should match /configuration loaded for #{@hs_name}/
  @output.should match /Generating the hotspot data/
  @output.should match /BRAS config generated/
  @output.should match /Auth portal config generated/
end

Then /^I should see all the generated stuff$/ do
  Dir.glob("generated/#{@hs_name}/*").should include "generated/#{@hs_name}/BRAS"
  Dir.glob("generated/#{@hs_name}/*").should include "generated/#{@hs_name}/portal"
end

