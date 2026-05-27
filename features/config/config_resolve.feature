Feature: config resolve

  Background:
    Given ~/.h3ctl already exists
    And a cluster named "prod" exists with default config

  Scenario: resolve returns all fields at their effective values for a vm
    When I run "h3ctl --cluster prod --vm cp0 config resolve"
    Then the command succeeds
    And stdout contains "cpus"
    And stdout contains "memory"
    And stdout contains "mac"
    And stdout contains "talos_version"
    And stdout contains "qemu_cmd"

  Scenario: resolve shows vm override winning over cluster default
    Given the cluster config for "prod" has cpus set to "4"
    And vm "cp0" in cluster "prod" has "cpus" set to "8"
    When I run "h3ctl --cluster prod --vm cp0 config resolve"
    Then the command succeeds
    And stdout contains "cpus: 8"

  Scenario: resolve shows cluster default when vm has no override
    Given the cluster config for "prod" has cpus set to "4"
    And vm "cp0" in cluster "prod" has no override for "cpus"
    When I run "h3ctl --cluster prod --vm cp0 config resolve"
    Then the command succeeds
    And stdout contains "cpus: 4"

  Scenario: resolve shows merged qemu_extra_args from all levels
    Given the cluster config for "prod" has qemu_extra_args containing "-device,virtio-serial"
    And vm "w0" in cluster "prod" has qemu_extra_args containing "-device,usb-tablet"
    When I run "h3ctl --cluster prod --vm w0 config resolve"
    Then the command succeeds
    And stdout contains "virtio-serial"
    And stdout contains "usb-tablet"

  Scenario: resolve --output json returns valid JSON with all effective fields
    When I run "h3ctl --cluster prod --vm cp0 config resolve --output json"
    Then the command succeeds
    And stdout is valid JSON

  Scenario: resolve without --vm fails
    When I run "h3ctl --cluster prod config resolve"
    Then the command fails with "requires --vm"
