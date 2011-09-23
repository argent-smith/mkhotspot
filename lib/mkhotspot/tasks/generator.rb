module Mkhotspot
  module Tasks
    class Generator < Thor::Group
      include Thor::Actions

      class_option :cfg_file,
        :type    => :string,
        :default => "hotspot.cfg",
        :desc    => "input configuration filename",
        :aliases => "-f",
        :banner  => "FILE"

      attr_reader :cfg

      def self.source_root
        File.expand_path('../../templates', File.dirname(__FILE__))
      end

      def configure
        options[:cfg_file].tap do |cf|
          begin
            @cfg = Mkhotspot::Config.new :file => cf
          rescue => error
            say "FATAL: ", :bold
            raise Thor::Error, error.message
          end
        end
      end

      def generate
        puts cfg
      end

    end
  end
end
