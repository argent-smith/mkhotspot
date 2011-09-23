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
      special_help = Help.new
      case task
      when nil
        special_help.show_app_description
        special_help.show_app_usage
      when "generate"
        Mkhotspot::Tasks::Generator.class_options_help shell
      end
      super
    end

  end
end
