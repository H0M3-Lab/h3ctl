Feature: config MAC address compute-and-store

  Background:
    Given ~/.h3ctl already exists

  Scenario: setting network_mac_prefix assigns MACs to all VMs without a mac field
    Given a cluster named "prod" exists with vms "cp0", "cp1", "w0" and no mac fields
    When I run "h3ctl --cluster prod config set network_mac_prefix=02:00:00:00:00"
    Then the command succeeds
    And vm "cp0" in cluster "prod" has "mac" set to "02:00:00:00:00:01"
    And vm "cp1" in cluster "prod" has "mac" set to "02:00:00:00:00:02"
    And vm "w0" in cluster "prod" has "mac" set to "02:00:00:00:00:03"

  Scenario: setting network_mac_prefix does not overwrite existing mac fields
    Given a cluster named "prod" exists with vms "cp0", "cp1", "w0"
    And vm "w0" in cluster "prod" has "mac" set to "02:00:00:00:01:ff"
    When I run "h3ctl --cluster prod config set network_mac_prefix=02:00:00:00:00"
    Then the command succeeds
    And vm "cp0" in cluster "prod" has "mac" set to "02:00:00:00:00:01"
    And vm "w0" in cluster "prod" has "mac" set to "02:00:00:00:01:ff"

  Scenario: MACs remain stable when a VM is removed
    Given a cluster named "prod" exists with vms "cp0", "cp1", "w0"
    And vm "cp0" in cluster "prod" has "mac" set to "02:00:00:00:00:01"
    And vm "cp1" in cluster "prod" has "mac" set to "02:00:00:00:00:02"
    And vm "w0" in cluster "prod" has "mac" set to "02:00:00:00:00:03"
    When I run "h3ctl --cluster prod --vm cp1 vm delete"
    Then vm "cp0" in cluster "prod" has "mac" set to "02:00:00:00:00:01"
    And vm "w0" in cluster "prod" has "mac" set to "02:00:00:00:00:03"

  Scenario: new VM after removal gets next unused MAC from prefix range
    Given a cluster named "prod" exists with network_mac_prefix "02:00:00:00:00"
    And vm "cp0" has mac "02:00:00:00:00:01"
    And vm "w0" has mac "02:00:00:00:00:03"
    When I run "h3ctl --cluster prod config set vms.w1.cpus=8 vms.w1.memory=4096 vms.w1.disk_size=10G"
    Then vm "w1" in cluster "prod" has "mac" set to "02:00:00:00:00:04"
