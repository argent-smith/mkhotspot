Feature: CLI usage
  In order to create a full set of hotspot configs
  As a sysadmin
  I want to run "mkhotspot" with all possibleoptions 
  and get the relevant results both on the console 
  and on the disk

  Background:
    Given I found "mkhotspot" binary

  @wip
  Scenario: I start the program without CLI options 
    When I run `mkhotspot`
    Then it should pass with:
    """
    "generate" was called incorrectly
    """

  @wip
  Scenario Outline: I look up the version
    When I run `mkhotspot <option>`
    Then the output should match /^\d+.\d+.\d+$/

    Examples:
      | option    |
      | -v        |
      | -V        |
      | --version |
      | version   |

  @wip
  Scenario Outline: I start configuration parser without a config file
    When I run `mkhotspot <option>`
    Then it should pass with:
    """
    "configure" was called incorrectly
    """

    Examples:
      | option    |
      | -c        |
      | --config  |
      | configure |

  @wip
  Scenario Outline: I start configuration parser supplying a nonexistent file
    When I run `mkhotspot <option> examples/hotspot.cfg`
    Then it should pass with:
    """
    Configuration file 'examples/hotspot.cfg' was not found!
    """

    Examples:
      | option    |
      | -c        |
      | --config  |
      | configure |

  @wip
  Scenario Outline: I start configuration parser supplying a config file
    And a file named "examples/hotspot.cfg" with:
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
    When I run `mkhotspot <option> examples/hotspot.cfg`
    Then it should pass with:
    """
    Parsing configuration file examples/hotspot.cfg
    """

    Examples:
      | option    |
      | -c        |
      | --config  |
      | configure |

