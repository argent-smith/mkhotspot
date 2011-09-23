require 'rubygems'
require 'bundler/setup'
require 'fileutils'
require 'aruba/cucumber'

require 'mkhotspot'

Before do
  @aruba_timeout_seconds = 10
end
