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

      attr_reader  :hotspot

      def self.source_root
        File.expand_path('../../../templates', File.dirname(__FILE__))
      end

      def configure
        options[:cfg_file].tap do |cf|
          begin
            @hotspot = Mkhotspot::Config.new :file => cf
          rescue => error
            say "FATAL: ", :bold
            raise Thor::Error, error.message
          end
        end
      end

      def generate
        directory ".", hotspot.name
      end

      private

      # Template helpers

      def bras
        hotspot.bras
      end

    end
  end
end
