@integration
Feature: talos apply-config

  Background:
    Given integration prerequisites are available
    Given ~/.h3ctl already exists

  Scenario: apply sends machine config to a controlplane node
    Given a cluster named "lab" exists and talos configs are generated
    And vm "cp0" in cluster "lab" is running in maintenance mode with IP "192.168.1.101"
    When I run "h3ctl --cluster lab --vm cp0 talos apply-config"
    Then the command succeeds

  Scenario: apply sends machine config to a worker node
    Given a cluster named "lab" exists and talos configs are generated
    And vm "w0" in cluster "lab" is running in maintenance mode with IP "192.168.1.103"
    When I run "h3ctl --cluster lab --vm w0 talos apply-config"
    Then the command succeeds

  Scenario: apply fails if VM has no cached IP
    Given a cluster named "lab" exists and talos configs are generated
    And no cached IP exists for vm "cp0" in cluster "lab"
    When I run "h3ctl --cluster lab --vm cp0 talos apply-config"
    Then the command fails with "no IP"

  Scenario: apply fails if talos config does not exist
    Given a cluster named "lab" exists with no generated talos configs
    And vm "cp0" in cluster "lab" is running with IP "192.168.1.101"
    When I run "h3ctl --cluster lab --vm cp0 talos apply-config"
    Then the command fails with "config not found"
