$:.unshift(File.expand_path(File.dirname(__FILE__)))
require 'config/bras'
require 'config/portal'

module Mkhotspot
  class Config
    attr_reader :bras, :portal, :name

    def initialize(ops = {})
      @name = ops[:name]
      @file = ops[:file]
      @text = ops[:text]

      unless (@file.nil? || @file.empty?)
        @text ||= File.read(@file)
      end
      @text.tap do |txt|
        instance_eval txt
      end unless (@text.nil? || @text.empty?)
    end

    def configure_bras(name, &bk)
      @bras = BRAS.new(name, &bk)
    end

    def configure_portal(name, &bk)
      @portal = Portal.new(name, &bk)
    end

    def hotspot(name, &bk)
      @name = name
      instance_eval &bk
    end
  end
end
