require 'thor'
require 'thor/group'
require 'mkhotspot/version'

module Mkhotspot

  class App < Thor
    map %w(-v -V --version) => :version

    desc "version", "Display the current version number"
    def version
      say "Simple ISP hotspot generator version #{Mkhotspot::VERSION}"
    end

    register Mkhotspot::Tasks::Generator,
      :generate,
      "generate [OPTIONS]",
      "Generates an ISG hotspot boilerplate"

    default_task :generate

    def help(task = nil, subcommand = false)
      super
      Mkhotspot::Tasks::Generator.class_options_help shell if task == "generate"
    end

  end
end
