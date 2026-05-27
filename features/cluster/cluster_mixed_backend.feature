@integration
Feature: cluster mixed backend

  Background:
    Given integration prerequisites are available
    Given ~/.h3ctl already exists

  Scenario: cluster with mixed backends starts all VMs regardless of backend
    Given no cluster named "mixed" exists
    When I run "h3ctl --cluster mixed cluster create --set network_mac_prefix=02:00:00:00:00"
    And I run "h3ctl --cluster mixed --vm w0 config set host_backend=tart"
    And I run "h3ctl --cluster mixed cluster start"
    Then the command succeeds
    And all VMs in cluster "mixed" are running
    And vm "cp0" in cluster "mixed" is managed by "qemu"
    And vm "w0" in cluster "mixed" is managed by "tart"
