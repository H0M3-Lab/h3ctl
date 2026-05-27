Feature: config unset

  Background:
    Given ~/.h3ctl already exists
    And a cluster named "prod" exists with default config

  Scenario: unset a cluster-level field restores built-in default
    Given the cluster config for "prod" has talos_version set to "v1.14.0"
    When I run "h3ctl --cluster prod config unset talos_version"
    Then the command succeeds
    And the cluster config for "prod" contains the built-in default for "talos_version"

  Scenario: unset a vm-level field restores cluster-level value
    Given vm "cp0" in cluster "prod" has "cpus" set to "8"
    When I run "h3ctl --cluster prod --vm cp0 config unset cpus"
    Then the command succeeds
    And vm "cp0" in cluster "prod" has no override for "cpus"

  Scenario: unset multiple fields at once
    Given vm "w0" in cluster "prod" has "cpus" set to "8"
    And vm "w0" in cluster "prod" has "memory" set to "4096"
    When I run "h3ctl --cluster prod --vm w0 config unset cpus memory"
    Then the command succeeds
    And vm "w0" in cluster "prod" has no override for "cpus"
    And vm "w0" in cluster "prod" has no override for "memory"

  Scenario: unset fails for cluster_name
    When I run "h3ctl --cluster prod config unset cluster_name"
    Then the command fails with "read-only"

  Scenario: unset a field that is not set succeeds silently
    Given vm "cp0" in cluster "prod" has no override for "cpus"
    When I run "h3ctl --cluster prod --vm cp0 config unset cpus"
    Then the command succeeds
