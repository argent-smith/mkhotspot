$:.unshift(File.expand_path(File.dirname(__FILE__)))
require "mkhotspot/version"
require "mkhotspot/extensions/symbol"

module Mkhotspot
  autoload :App,    "mkhotspot/app"
  autoload :Config, "mkhotspot/config"
end
