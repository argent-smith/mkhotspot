require 'thor'
require 'thor/group'
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
      say "Simple ISP hotspot generator version #{Mkhotspot::VERSION}"
    end

    class Generator < Thor::Group
      def configure
      end

      def generate
      end
    end
  end
end
