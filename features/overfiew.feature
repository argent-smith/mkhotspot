Feature: Overview
  In order to create a full set of hotspot configs
  As a sysadmin
  I want to run "mkhotspot" and get the results both on the console and on the disk

  Scenario: I start the program without CLI options
    Given I found "mkhotspot" binary
    When I run `mkhotspot`
    Then it should pass with:
    """
    Tasks:
    """


  Scenario: I look up the version
    Given I found "mkhotspot" binary
    When I run `mkhotspot` with the following options:
      | -v        |
      | -V        |
      | --version |
      | version   |

    Then the output should match /^\d+.\d+.\d+$/

