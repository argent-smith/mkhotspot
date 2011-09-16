require 'thor'
require 'mkhotspot/version'

module Mkhotspot
  class App < Thor
    include Thor::Actions

    default_task :generate

    map %w(-v -V --version) => :version

    def self.source_root
      File.expand_path('../../templates', File.dirname(__FILE__))
    end

    desc "version", "Get the current version number"
    def version
      say Mkhotspot::VERSION
    end

    desc "generate HS_NAME", "Generate the configuration set for a hotspot"
    method_option :clean, :type => :boolean, :default => false, :aliases => "-c", :desc => "Remove the hotspot dir before doing the generation job"
    def generate(hs_name)
      puts "Generating the configuration set for a hotspot #{hs_name}"
    end

  end
end
