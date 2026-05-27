Feature: config get

  Background:
    Given ~/.h3ctl already exists
    And a cluster named "prod" exists with default config

  Scenario: get returns the cluster-level value of a field
    When I run "h3ctl --cluster prod config get talos_version"
    Then the command succeeds
    And stdout contains "v1.13.0"

  Scenario: get with --vm returns vm-level value when set
    Given vm "cp0" in cluster "prod" has "cpus" set to "8"
    When I run "h3ctl --cluster prod --vm cp0 config get cpus"
    Then the command succeeds
    And stdout contains "8"

  Scenario: get with --vm falls back to cluster-level when vm has no override
    Given vm "cp0" in cluster "prod" has no override for "cpus"
    When I run "h3ctl --cluster prod --vm cp0 config get cpus"
    Then the command succeeds
    And stdout contains the cluster default for "cpus"

  Scenario: get fails for unknown field
    When I run "h3ctl --cluster prod config get nonexistent_field"
    Then the command fails with "unknown field"

  Scenario: get fails for cluster-only field used with --vm
    When I run "h3ctl --cluster prod --vm cp0 config get cluster_name"
    Then the command fails with "cluster-only field"

  Scenario: get fails for unknown cluster
    When I run "h3ctl --cluster ghost config get talos_version"
    Then the command fails with "no cluster named"
