Feature: vm add

  Background:
    Given ~/.h3ctl already exists
    And a cluster named "prod" exists with network_mac_prefix "02:00:00:00:00"
    And vms "cp0", "cp1", "w0" exist with assigned MACs

  Scenario: add registers a new VM in config and assigns a MAC from prefix range
    When I run "h3ctl --cluster prod config set vms.w1.cpus=8 vms.w1.memory=4096 vms.w1.disk_size=10G"
    Then the command succeeds
    And vm "w1" exists in cluster "prod"
    And vm "w1" in cluster "prod" has a mac assigned from prefix "02:00:00:00:00"
    And the mac for vm "w1" does not conflict with existing VMs

  Scenario: added VM gets the next unused MAC not the next sequential
    Given vm "cp1" in cluster "prod" has mac "02:00:00:00:00:02" and has been deleted
    When I run "h3ctl --cluster prod config set vms.w1.cpus=8 vms.w1.memory=4096 vms.w1.disk_size=10G"
    Then the command succeeds
    And vm "w1" in cluster "prod" has "mac" set to "02:00:00:00:00:04"

  Scenario: vm key with invalid prefix is rejected at add time
    When I run "h3ctl --cluster prod config set vms.x0.cpus=8 vms.x0.memory=2048 vms.x0.disk_size=10G"
    Then the command fails with "unknown vm prefix"
