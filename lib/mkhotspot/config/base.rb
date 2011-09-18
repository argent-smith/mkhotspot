module Mkhotspot
  class Config
    # Basic Config DSL unit
    class Base

      attr_reader   :name       # Unit name

      # Sets the name and instance_eval's the supplied block
      def initialize name, &bk
        @name = name
        instance_eval &bk
      end

      # Dynamic DSL-suitable method virtualizer
      def method_missing(sym, *args, &block)
        if args.empty?
          instance_variable_get sym.to_instance_variable
        else
          instance_variable_set sym.to_instance_variable, args.first
        end
      end

    end
  end
end
