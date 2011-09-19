Feature: Overview
  In order to create a full set of hotspot configs
  As a sysadmin
  I want to run "mkhotspot" and get the results both on the console and on the disk

  @ready
  Scenario: I start the program without CLI options 
            and see the error output from the default "generate" task
    Given I found "mkhotspot" binary
    When I run `mkhotspot`
    Then it should pass with:
    """
    "generate" was called incorrectly
    """

  @ready
  Scenario Outline: I look up the version
    Given I found "mkhotspot" binary
    When I run `mkhotspot <option>`
    Then the output should match /^\d+.\d+.\d+$/

    Examples:
      | option    |
      | -v        |
      | -V        |
      | --version |
      | version   |

