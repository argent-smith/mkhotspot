Feature: ISG boilerplate generator
  In order to create a boilerplate
  As a sysadmin
  I run "mkhotspot" with a ready b/p configuration

  Background: We've got a config file
    Given a file named "config.cfg" with:
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
  Scenario: Nothing. Just thinkin' about
    When I run `cat config.cfg`
    Then the output should contain exactly:
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


  Scenario: mkhotspot generates a destination dir with hotspot's name

