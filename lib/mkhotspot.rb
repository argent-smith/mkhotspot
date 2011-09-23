# common dependencies and definitions

$:.unshift(File.expand_path(File.dirname(__FILE__)))
require 'thor'
require 'thor/group'
require "mkhotspot/version"
require "mkhotspot/extensions/symbol"

module Mkhotspot
  autoload :App,    "mkhotspot/app"
  autoload :Tasks,  "mkhotspot/tasks"
  autoload :Config, "mkhotspot/config"
  autoload :Help,   "mkhotspot/help"
end
