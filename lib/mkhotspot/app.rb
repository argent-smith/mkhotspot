require 'thor'
require 'mkhotspot/version'

module Mkhotspot
  class App < Thor
    include Thor::Actions

    map %w(-v -V --version) => :version

    def self.source_root
      File.expand_path('../../templates', File.dirname(__FILE__))
    end

    desc "version", "Get the current version number"
    def version
      say Mkhotspot::VERSION
    end

  end
end
