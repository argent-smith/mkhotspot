Feature: Overview
  As a sysadmin
  In order to create a full set of hotspot configs
  I want to run "mkhotspot" and get the results both onthe console and on the disk

  Scenario: I run "mkhotspot"
    Given I found "mkhotspot" binary
    When I run `mkhotspot newhotspot`
    Then the output should contain:
    """
    configuration loaded for newhotspot
    Generating the hotspot data
    BRAS config generated
    Auth portal config generated
    """
    And the following directories should exist:
      | generated/newhotspot/BRAS   |
      | generated/newhotspot/portal |

