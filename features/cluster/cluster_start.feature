@integration
Feature: cluster start

  Background:
    Given integration prerequisites are available
    Given ~/.h3ctl already exists

  Scenario: start boots all VMs, provisions Talos, and bootstraps the cluster
    Given no cluster named "lab" exists
    When I run "h3ctl --cluster lab cluster create --set network_mac_prefix=02:00:00:00:00"
    And I run "h3ctl --cluster lab cluster start"
    Then the command succeeds
    And all VMs in cluster "lab" are running
    And a talosconfig exists for cluster "lab"
    And a kubeconfig exists for cluster "lab"

  Scenario: start on an already-provisioned cluster restarts VMs only
    Given a cluster named "lab" exists and is provisioned
    And no VMs in cluster "lab" are running
    When I run "h3ctl --cluster lab cluster start"
    Then the command succeeds
    And all VMs in cluster "lab" are running
