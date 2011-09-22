require 'thor'
require 'thor/group'
require 'mkhotspot/version'

module Mkhotspot
  class App < Thor
    include Thor::Actions

    map %w(-v -V --version) => :version

    desc "version", "Get the current version number"
    def version
      say "Simple ISP hotspot generator version #{Mkhotspot::VERSION}"
    end

    class Generator < Thor::Group
      include Thor::Actions

      class_option :f,
          :type => :string,
          :default => "hotspot.cfg"

      desc %(see "help generate")

      def self.source_root
        File.expand_path('../../templates', File.dirname(__FILE__))
      end

      def configure
        say "foo", :green
      end

      def generate
        say "bar", :green
      end
    end

    register Generator,
      :generate,
      "generate",
      "Generates the set of files defining an ISG hotspot"

    default_task :generate

  end
end
