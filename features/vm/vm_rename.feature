Feature: vm rename

  Background:
    Given ~/.h3ctl already exists
    And a cluster named "prod" exists with default config

  Scenario: rename moves disk and service files and updates yaml key
    Given vm "w0" in cluster "prod" is not running
    When I run "h3ctl --cluster prod --vm w0 vm rename w1"
    Then the command succeeds
    And vm "w1" exists in cluster "prod"
    And no vm "w0" exists in cluster "prod"
    And a disk image exists for vm "w1" in cluster "prod"
    And no disk image exists for vm "w0" in cluster "prod"

  Scenario: rename fails if VM is running
    Given vm "w0" in cluster "prod" is running
    When I run "h3ctl --cluster prod --vm w0 vm rename w1"
    Then the command fails with "vm is running"

  Scenario: rename fails if target name already exists
    Given vm "w0" in cluster "prod" is not running
    And vm "w1" exists in cluster "prod"
    When I run "h3ctl --cluster prod --vm w0 vm rename w1"
    Then the command fails with "already exists"
