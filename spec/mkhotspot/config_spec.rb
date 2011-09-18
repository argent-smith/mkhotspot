require File.expand_path('../spec_helper', File.dirname(__FILE__))
require File.expand_path('../../lib/mkhotspot', File.dirname(__FILE__))

describe Mkhotspot do
  describe Config, "DSL"  do
    before :each do
      @config = Mkhotspot::Config.new "hodzpod_01"
    end

    it "defines the BRAS construct" do
      @config.instance_eval do
        configure_bras "Cisco1" do
          ip       "10.0.0.1"
          login    "admin"
          password "foobar"
          enable   "zozozo"
        end
      end
      @config.bras.name.should     == "Cisco1"
      @config.bras.ip.should       == "10.0.0.1"
      @config.bras.login.should    == "admin"
      @config.bras.password.should == "foobar"
      @config.bras.enable.should   == "zozozo"
    end

    it "defines the portal construct" do
      @config.instance_eval do
        configure_portal "Portal1" do
          v_server_name  "kewlportal.net"
          v_server_alias nil
          server_ip      "10.0.0.2"
          document_root  "/usr/work/www/kewlportal/html"
        end
      end
      @config.portal.name.should            == "Portal1"
      @config.portal.v_server_name.should   == "kewlportal.net"
      @config.portal.v_server_alias.should  == nil
      @config.portal.server_ip.should       == "10.0.0.2"
      @config.portal.document_root.should   == "/usr/work/www/kewlportal/html"
    end
  end
end
