$:.unshift(File.expand_path(File.dirname(__FILE__)))
require 'config/bras'
require 'config/portal'

module Mkhotspot
  class Config
    attr_reader :bras, :portal, :name

    def initialize(name)
      @name = name
      if block_given?
        instance_eval do yield end
      end
    end

    def configure_bras(name, &bk)
      @bras = BRAS.new(name, &bk)
    end

    def configure_portal(name, &bk)
      @portal = Portal.new(name, &bk)
    end
  end
end
