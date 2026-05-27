Feature: h3ctl destroy

  Scenario: destroy wipes ~/.h3ctl when no clusters exist
    Given ~/.h3ctl already exists
    And no clusters exist
    When I run "h3ctl destroy --confirm"
    Then the command succeeds
    And ~/.h3ctl does not exist

  Scenario: destroy wipes ~/.h3ctl and all clusters
    Given ~/.h3ctl already exists
    And a cluster named "alpha" exists
    And a cluster named "beta" exists
    When I run "h3ctl destroy --confirm"
    Then the command succeeds
    And ~/.h3ctl does not exist

  Scenario: destroy requires confirmation flag
    Given ~/.h3ctl already exists
    When I run "h3ctl destroy"
    Then the command fails with "requires --confirm"
    And ~/.h3ctl directory exists

  Scenario: destroy when not initialised fails gracefully
    Given ~/.h3ctl does not exist
    When I run "h3ctl destroy --confirm"
    Then the command fails with "not initialised"
