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

