Feature: ISG boilerplate generator
  In order to create a boilerplate
  As a sysadmin
  I run "mkhotspot" with a ready b/p configuration

  Background: We've got a config file
    Given a file named "config.cfg" with:
    """
    hotspot "HS_01" do
    end
    """

  Scenario: mkhotspot generates a destination dir with hotspot's name
