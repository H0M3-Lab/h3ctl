Feature: svc per-VM control

  Background:
    Given ~/.h3ctl already exists
    And a cluster named "prod" exists with default config

  Scenario: write generates service file on disk without loading it
    Given vm "cp0" in cluster "prod" is not running
    When I run "h3ctl --cluster prod --vm cp0 svc write"
    Then the command succeeds
    And a service file exists for vm "cp0" in cluster "prod"
    And vm "cp0" in cluster "prod" is not running

  Scenario: show prints the contents of the generated service file
    Given a service file exists for vm "cp0" in cluster "prod"
    When I run "h3ctl --cluster prod --vm cp0 svc show"
    Then the command succeeds
    And stdout contains "cp0"

  Scenario: load starts a VM from its service file
    Given a service file exists for vm "cp0" in cluster "prod"
    And vm "cp0" in cluster "prod" is not running
    When I run "h3ctl --cluster prod --vm cp0 svc load"
    Then the command succeeds
    And vm "cp0" in cluster "prod" is running

  Scenario: unload stops a running VM
    Given vm "cp0" in cluster "prod" is running
    When I run "h3ctl --cluster prod --vm cp0 svc unload"
    Then the command succeeds
    And vm "cp0" in cluster "prod" is not running

  Scenario: reload stops and restarts a VM without touching disk or logs
    Given vm "cp0" in cluster "prod" is running
    When I run "h3ctl --cluster prod --vm cp0 svc reload"
    Then the command succeeds
    And vm "cp0" in cluster "prod" is running

  Scenario: load fails if no service file exists
    Given no service file exists for vm "cp0" in cluster "prod"
    When I run "h3ctl --cluster prod --vm cp0 svc load"
    Then the command fails with "no service file"

  Scenario: show fails if no service file exists
    Given no service file exists for vm "cp0" in cluster "prod"
    When I run "h3ctl --cluster prod --vm cp0 svc show"
    Then the command fails with "no service file"

  Scenario: write overwrites an existing service file
    Given a service file exists for vm "cp0" in cluster "prod"
    When I run "h3ctl --cluster prod --vm cp0 svc write"
    Then the command succeeds
    And a service file exists for vm "cp0" in cluster "prod"
