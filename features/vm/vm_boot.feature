Feature: vm boot

  Background:
    Given ~/.h3ctl already exists
    And a cluster named "prod" exists with default config

  Scenario: boot creates disk image and loads service
    Given vm "cp0" in cluster "prod" is not running
    When I run "h3ctl --cluster prod --vm cp0 vm boot"
    Then the command succeeds
    And a disk image exists for vm "cp0" in cluster "prod"
    And a service file exists for vm "cp0" in cluster "prod"
    And vm "cp0" in cluster "prod" is running

  Scenario: boot fails if vm is already running
    Given vm "cp0" in cluster "prod" is running
    When I run "h3ctl --cluster prod --vm cp0 vm boot"
    Then the command fails with "already running"

  Scenario: boot fails for unknown vm
    When I run "h3ctl --cluster prod --vm ghost vm boot"
    Then the command fails with "no vm named"

  @integration
  Scenario: boot downloads Talos image if not cached
    Given vm "cp0" in cluster "prod" is not running
    And the Talos image for cluster "prod" is not cached
    When I run "h3ctl --cluster prod --vm cp0 vm boot"
    Then the command succeeds
    And a cached image exists for the talos version of cluster "prod"
    And vm "cp0" in cluster "prod" is running
