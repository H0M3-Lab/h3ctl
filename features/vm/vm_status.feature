Feature: vm status

  Background:
    Given ~/.h3ctl already exists
    And a cluster named "prod" exists with default config

  Scenario: status shows running for a running VM
    Given vm "cp0" in cluster "prod" is running
    When I run "h3ctl --cluster prod --vm cp0 vm status"
    Then the command succeeds
    And stdout contains "running"

  Scenario: status shows stopped for a stopped VM
    Given vm "cp0" in cluster "prod" is not running
    When I run "h3ctl --cluster prod --vm cp0 vm status"
    Then the command succeeds
    And stdout contains "stopped"

  Scenario: status --output json returns valid JSON
    Given vm "cp0" in cluster "prod" is running
    When I run "h3ctl --cluster prod --vm cp0 vm status --output json"
    Then the command succeeds
    And stdout is valid JSON

  Scenario: status shows maintenance for a VM in maintenance mode
    Given vm "cp0" in cluster "prod" is in maintenance mode
    When I run "h3ctl --cluster prod --vm cp0 vm status"
    Then the command succeeds
    And stdout contains "maintenance"

  Scenario: status fails for unknown VM
    When I run "h3ctl --cluster prod --vm ghost vm status"
    Then the command fails with "no vm named"
