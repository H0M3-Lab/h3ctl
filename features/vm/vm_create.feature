Feature: vm create

  Background:
    Given ~/.h3ctl already exists
    And a cluster named "prod" exists with default config

  Scenario: create allocates disk image without booting
    Given vm "w0" in cluster "prod" has no disk image
    When I run "h3ctl --cluster prod --vm w0 vm create"
    Then the command succeeds
    And a disk image exists for vm "w0" in cluster "prod"
    And vm "w0" in cluster "prod" is not running

  Scenario: create fails if disk image already exists
    Given a disk image exists for vm "cp0" in cluster "prod"
    When I run "h3ctl --cluster prod --vm cp0 vm create"
    Then the command fails with "disk already exists"

  Scenario: create fails for a VM not defined in config
    When I run "h3ctl --cluster prod --vm ghost vm create"
    Then the command fails with "no vm named"
