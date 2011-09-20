Feature: Configuration DSL
  In order to provide data for templates
  As a sysadmin
  I want the program to parse a configuration file written in a special DSL
  And set up the appropriate configuration objects

  Background:
    Given I've connected to the app via Thor API
    Given a file named "examples/hotspot.cfg" with:
    """
    # Toplevel hotspot configuration
    hotspot "HS_01" do

      # BRAS configuration
      configure_bras "Cisco1" do
        ip       "10.0.0.1"
        login    "admin"
        password "foobar"
        enable   "zozozo"
      end

      # Portal configuration
      configure_portal "Portal1" do
        v_server_name  "kewlportal.net"
        v_server_alias nil
        server_ip      "10.0.0.2"
        document_root  "/usr/work/www/kewlportal/html"
      end
    end
    """

  @wip
  Scenario: I check the config top-level parser
    When I invoke the parser for "tmp/aruba/examples/hotspot.cfg"
    Then the configured values should be in place for "HS_01"
