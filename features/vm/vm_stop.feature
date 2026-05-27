Feature: vm stop

  Background:
    Given ~/.h3ctl already exists
    And a cluster named "prod" exists with default config

  Scenario: stop halts a running VM and clears its IP
    Given vm "cp0" in cluster "prod" is running
    When I run "h3ctl --cluster prod --vm cp0 vm stop"
    Then the command succeeds
    And vm "cp0" in cluster "prod" is not running
    And no cached IP exists for vm "cp0" in cluster "prod"

  Scenario: stop on an already-stopped VM succeeds silently
    Given vm "cp0" in cluster "prod" is not running
    When I run "h3ctl --cluster prod --vm cp0 vm stop"
    Then the command succeeds

  Scenario: stop fails for unknown VM
    When I run "h3ctl --cluster prod --vm ghost vm stop"
    Then the command fails with "no vm named"
