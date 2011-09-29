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
    When I run `mkhotspot -f config.cfg`

  @wip
  Scenario: mkhotspot generates a destination dir with hotspot's name
    Then a directory named "HS_01" should exist
    And a file named "HS_01/BRAS/ISG_Cisco1.confg" should exist
    And the file "HS_01/BRAS/ISG_Cisco1.confg" should contain exactly:
    """
    ! Cisco ISG configuration created by mkhotspot
    ! Hotspot name: HS_01
    ! BRAS name:    Cisco1

    """

