module Mkhotspot
  module Extensions
    module Symbol
      # Converts a symbol to an instance variable name
      # Usage: `sym.to_instance_variable`
      # Returns: Symbol which is `@sym`
      def to_instance_variable
        ('@' + self.to_s).to_sym
      end
    end
  end
end

Symbol.send(:include, Mkhotspot::Extensions::Symbol)
