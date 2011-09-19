require 'thor'
require 'mkhotspot/version'
require 'mkhotspot/config'

module Mkhotspot
  class App < Thor
    include Thor::Actions

    default_task :generate

    map %w(-v -V --version) => :version
    map %w(-c --config)     => :configure

    def self.source_root
      File.expand_path('../../templates', File.dirname(__FILE__))
    end

    desc "version", "Get the current version number"
    def version
      say Mkhotspot::VERSION
    end

    desc "configure FILE", "Parse configuration FILE and set the corresponding parameters"
    def configure(cfg_file)
      if File.exists?(cfg_file)
        puts File.read(cfg_file)
        puts "Parsing configuration file #{cfg_file}"
        @cfg = Mkhotspot::Config.new :file => cfg_file
      else
        say "Configuration file '#{cfg_file}' was not found!", :red
      end
    end

    desc "generate HS_NAME", "Generate the configuration set for a hotspot"
    method_option :cfile, :type => :string,  :default => nil,   :aliases => "-cf", :desc => "path to configuration file"
    method_option :clean, :type => :boolean, :default => false, :aliases => "-c",  :desc => "Remove the hotspot dir before doing the generation job"
    def generate(hs_name)
      puts "Generating the configuration set for a hotspot #{hs_name}"
    end

  end
end
