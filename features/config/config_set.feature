Feature: config set

  Background:
    Given ~/.h3ctl already exists
    And a cluster named "prod" exists with default config

  Scenario: set updates a cluster-level scalar field
    When I run "h3ctl --cluster prod config set talos_version=v1.14.0"
    Then the command succeeds
    And the cluster config for "prod" contains talos_version "v1.14.0"

  Scenario: set updates multiple fields at once
    When I run "h3ctl --cluster prod config set talos_version=v1.14.0 network_iface=en1"
    Then the command succeeds
    And the cluster config for "prod" contains talos_version "v1.14.0"
    And the cluster config for "prod" contains network_iface "en1"

  Scenario: set updates a vm-level field
    When I run "h3ctl --cluster prod --vm cp0 config set cpus=8"
    Then the command succeeds
    And vm "cp0" in cluster "prod" has "cpus" set to "8"
    And the cluster-level "cpus" is unchanged

  Scenario: set multiple vm-level fields at once
    When I run "h3ctl --cluster prod --vm w0 config set cpus=8 memory=4096"
    Then the command succeeds
    And vm "w0" in cluster "prod" has "cpus" set to "8"
    And vm "w0" in cluster "prod" has "memory" set to "4096"

  Scenario: set fails for cluster_name
    When I run "h3ctl --cluster prod config set cluster_name=other"
    Then the command fails with "read-only"

  Scenario: set fails for network_mac_prefix with --vm
    When I run "h3ctl --cluster prod --vm cp0 config set network_mac_prefix=02:00:00:00:00"
    Then the command fails with "cluster-only field"

  Scenario: set fails for cluster_name with --vm
    When I run "h3ctl --cluster prod --vm cp0 config set cluster_name=other"
    Then the command fails with "cluster-only field"

  Scenario: set with --set flag on cluster create applies fields at creation
    Given no cluster named "new" exists
    When I run "h3ctl --cluster new cluster create --set talos_version=v1.14.0 --set network_iface=en1"
    Then the command succeeds
    And the cluster config for "new" contains talos_version "v1.14.0"
    And the cluster config for "new" contains network_iface "en1"

  Scenario: set using vms.* dot-path registers a new VM with nested fields
    When I run "h3ctl --cluster prod config set vms.w1.cpus=8 vms.w1.memory=4096 vms.w1.disk_size=10G"
    Then the command succeeds
    And vm "w1" exists in cluster "prod"
    And vm "w1" in cluster "prod" has "cpus" set to "8"
    And vm "w1" in cluster "prod" has "memory" set to "4096"
    And vm "w1" in cluster "prod" has "disk_size" set to "10G"
