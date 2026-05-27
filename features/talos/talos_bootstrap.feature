@integration
Feature: talos bootstrap

  Background:
    Given integration prerequisites are available
    Given ~/.h3ctl already exists

  Scenario: bootstrap initialises etcd on the first controlplane
    Given a cluster named "lab" exists
    And vm "cp0" in cluster "lab" is running with Talos API available
    And a talosconfig file exists for cluster "lab"
    When I run "h3ctl --cluster lab --vm cp0 talos bootstrap"
    Then the command succeeds

  Scenario: bootstrap fails if Talos API is not ready
    Given a cluster named "lab" exists
    And vm "cp0" in cluster "lab" is running but Talos API is not ready
    When I run "h3ctl --cluster lab --vm cp0 talos bootstrap"
    Then the command fails with "API not ready"

  Scenario: bootstrap fails if talosconfig does not exist
    Given a cluster named "lab" exists with no generated talos configs
    When I run "h3ctl --cluster lab --vm cp0 talos bootstrap"
    Then the command fails with "talosconfig not found"
