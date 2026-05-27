Feature: cluster delete

  Background:
    Given ~/.h3ctl already exists

  Scenario: delete removes cluster directory and config
    Given a cluster named "prod" exists
    And no VMs in cluster "prod" are running
    When I run "h3ctl --cluster prod cluster delete"
    Then the command succeeds
    And no cluster directory exists for "prod"

  Scenario: delete fails if VMs are running
    Given a cluster named "prod" exists
    And vm "cp0" in cluster "prod" is running
    When I run "h3ctl --cluster prod cluster delete"
    Then the command fails with "cluster is running"

  Scenario: delete fails for unknown cluster
    Given no cluster named "ghost" exists
    When I run "h3ctl --cluster ghost cluster delete"
    Then the command fails with "no cluster named"

  Scenario: delete clears active context when the deleted cluster was active
    Given a cluster named "prod" exists
    And active cluster is set to "prod"
    And no VMs in cluster "prod" are running
    When I run "h3ctl --cluster prod cluster delete"
    Then the command succeeds
    And no active cluster is set
