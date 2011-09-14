Feature: Overview
  As a sysadmin
  In order to create a full set of hotspot configs
  I want to run "mkhotspot" and get the results both onthe console and on the disk

  Scenario: I run "mkhotspot"
    Given I found "mkhotspot" binary
    When I run it with "newhotspot" parameter
    Then I should see the progress messages
    And I should see all the generated stuff
