#!/usr/bin/env ruby

require 'rubygems'
require 'thor'

class Thing < Thor
  include Thor::Actions

  def self.source_root
    File.expand_path('templates', File.dirname(__FILE__))
  end

  desc "dotest", "do the test"
  def dotest
    directory ".", "generated"
  end

  private

  def variable
    "tezd"
  end
end

Thing.start
