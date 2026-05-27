Feature: vm delete

  Background:
    Given ~/.h3ctl already exists
    And a cluster named "prod" exists with default config

  Scenario: delete removes disk image and service file
    Given vm "w0" in cluster "prod" is not running
    And a disk image exists for vm "w0" in cluster "prod"
    When I run "h3ctl --cluster prod --vm w0 vm delete"
    Then the command succeeds
    And no disk image exists for vm "w0" in cluster "prod"
    And no service file exists for vm "w0" in cluster "prod"

  Scenario: delete fails if VM is running
    Given vm "cp0" in cluster "prod" is running
    When I run "h3ctl --cluster prod --vm cp0 vm delete"
    Then the command fails with "vm is running"
