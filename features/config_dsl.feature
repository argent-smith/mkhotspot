Feature: Configuration DSL
  In order to provide data for templates
  As a sysadmin
  I want the program to parse a configuration file written in a special DSL
  And set up the appropriate configuration objects

  @wip
  Scenario Outline: I start configuration parser without a config file
    Given I found "mkhotspot" binary
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
  Scenario Outline: I start configuration parser supplying a config file
    Given I found "mkhotspot" binary
    And a file named "examples/hotspot.cfg" with:
    """
    configuration "Hotspot1" do
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

  @wip
  Scenario Outline: I start configuration parser supplying a nonexistent file
    Given I found "mkhotspot" binary
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


