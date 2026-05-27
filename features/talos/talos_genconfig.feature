@integration
Feature: talos genconfig

  Background:
    Given integration prerequisites are available
    Given ~/.h3ctl already exists

  Scenario: genconfig creates controlplane, worker, and talosconfig files
    Given a cluster named "lab" exists with vms "cp0", "cp1", "w0"
    And all VMs in cluster "lab" have cached IPs
    When I run "h3ctl --cluster lab talos genconfig"
    Then the command succeeds
    And a controlplane config file exists for cluster "lab"
    And a worker config file exists for cluster "lab"
    And a talosconfig file exists for cluster "lab"

  Scenario: genconfig fails if no controlplane VM has a cached IP
    Given a cluster named "lab" exists with vms "cp0", "w0"
    And no cached IP exists for vm "cp0" in cluster "lab"
    When I run "h3ctl --cluster lab talos genconfig"
    Then the command fails with "no IP"

  Scenario: genconfig fails if cluster has no controlplane VMs
    Given a cluster named "lab" exists with only worker vms "w0", "w1"
    When I run "h3ctl --cluster lab talos genconfig"
    Then the command fails with "no controlplane"
