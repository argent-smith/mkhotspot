After do
  FileUtils.rm_rf "tmp"
end

Given /^I've connected to the app via Thor API$/ do
  @app = Mkhotspot::App.new
end

When /^I invoke the parser for "([^"]*)"$/ do |s|
  pending "WIP"
end

Then /^the configured values should be in place for "([^"]*)"$/ do |hs_name|
  pending "WIP"
end
