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
    Then the exit status should be 0

  @wip
  Scenario Outline: I look up the version
    When I run `mkhotspot <option>`
    Then the output should match /version \d+.\d+.\d+$/

    Examples:
      | option    |
      | -v        |
      | -V        |
      | --version |
      | version   |

  @wip
  Scenario Outline: I watch general help
    When I run `mkhotspot <option>`
    Then the output should match:
    """
    ^Usage:.*
    .*
    ^Tasks:.*
    """

    Examples:
      | option |
      | -h     |
      | --help |
      | help   |

  @wip
  Scenario Outline: It doesn't like the absense of configuration
    When I run `mkhotspot <task> <option> <parameter>`
    Then the output should contain:
    """
    FATAL: No such file or directory - <whats_bad>
    """

    Examples:
      | task     | option     | parameter | whats_bad   |
      |          |            |           | hotspot.cfg |
      |          | --cfg_file | 123.cfg   | 123.cfg     |
      |          | -f         | 123.cfg   | 123.cfg     |
      | generate |            |           | hotspot.cfg |
      | generate | --cfg_file | 123.cfg   | 123.cfg     |
      | generate | -f         | 123.cfg   | 123.cfg     |
