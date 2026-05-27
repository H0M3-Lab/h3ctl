Feature: config override rules

  Background:
    Given ~/.h3ctl already exists
    And a cluster named "prod" exists with default config

  # scalar override precedence

  Scenario: vm-level scalar overrides cluster-level
    Given the cluster config for "prod" has cpus set to "4"
    And vm "cp0" in cluster "prod" has "cpus" set to "8"
    When I run "h3ctl --cluster prod --vm cp0 config resolve"
    Then stdout contains "cpus: 8"

  Scenario: cluster-level scalar overrides built-in default
    Given the built-in default for "cpus" is "2"
    And the cluster config for "prod" has cpus set to "4"
    And vm "cp0" in cluster "prod" has no override for "cpus"
    When I run "h3ctl --cluster prod --vm cp0 config resolve"
    Then stdout contains "cpus: 4"

  Scenario: built-in default used when no overrides present
    Given the built-in default for "cpus" is "2"
    And the cluster config for "prod" has no override for "cpus"
    And vm "cp0" in cluster "prod" has no override for "cpus"
    When I run "h3ctl --cluster prod --vm cp0 config resolve"
    Then stdout contains "cpus: 2"

  # list append (qemu_extra_args)

  Scenario: vm-level qemu_extra_args appends to cluster-level list
    Given the cluster config for "prod" has qemu_extra_args containing "-device,virtio-serial"
    And vm "w0" in cluster "prod" has qemu_extra_args containing "-device,usb-tablet"
    When I run "h3ctl --cluster prod --vm w0 config resolve"
    Then stdout contains "virtio-serial"
    And stdout contains "usb-tablet"

  Scenario: vm-level qemu_extra_args does not replace cluster-level list
    Given the cluster config for "prod" has qemu_extra_args containing "-device,virtio-serial"
    And vm "w0" in cluster "prod" has qemu_extra_args containing "-device,usb-tablet"
    When I run "h3ctl --cluster prod --vm w0 config resolve"
    Then stdout contains "virtio-serial"

  Scenario: cluster-level qemu_extra_args appends to empty built-in default
    Given the cluster config for "prod" has qemu_extra_args containing "-device,virtio-serial"
    And vm "cp0" in cluster "prod" has no override for "qemu_extra_args"
    When I run "h3ctl --cluster prod --vm cp0 config resolve"
    Then stdout contains "virtio-serial"
