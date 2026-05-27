Feature: h3ctl init

  Scenario: init creates the h3ctl home directory
    Given ~/.h3ctl does not exist
    When I run "h3ctl init"
    Then the command succeeds
    And ~/.h3ctl directory exists
    And ~/.h3ctl/clusters directory exists
    And ~/.h3ctl/cache directory exists
    And ~/.h3ctl/cache/images directory exists
    And ~/.h3ctl/h3.yaml exists

  Scenario: init fails if already initialised
    Given ~/.h3ctl already exists
    When I run "h3ctl init"
    Then the command fails with "already initialised"

  Scenario: init succeeds after destroy
    Given ~/.h3ctl already exists
    When I run "h3ctl destroy --confirm"
    And I run "h3ctl init"
    Then the command succeeds
    And ~/.h3ctl directory exists
