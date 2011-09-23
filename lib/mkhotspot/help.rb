module Mkhotspot
  class Help < Thor

    no_tasks do

      def show_app_usage
        say %(Usage: mkhotspot [TASK] [OPTIONS])
        say %(  The default task is #{shell.set_color(%("generate"), :bold)} (see below))
        say
      end

      def show_app_description
        say %(ISG hotspot boilerplate generator)
        say
      end

    end
  end
end
