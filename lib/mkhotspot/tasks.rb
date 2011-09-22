$:.unshift(File.expand_path(File.dirname(__FILE__)))

module Mkhotspot
  module Tasks
    autoload :Generator,  "mkhotspot/tasks/generator"
  end
end
