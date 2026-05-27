@integration
Feature: talos upgrade

  Background:
    Given integration prerequisites are available
    Given ~/.h3ctl already exists

  Scenario: upgrade updates talos_version in config and upgrades each node in sequence
    Given a cluster named "lab" exists and is fully bootstrapped with talos_version "v1.13.0"
    When I run "h3ctl --cluster lab config set talos_version=v1.14.0"
    And I run "h3ctl --cluster lab --vm w0 talos upgrade"
    And I run "h3ctl --cluster lab --vm cp1 talos upgrade"
    And I run "h3ctl --cluster lab --vm cp0 talos upgrade"
    Then the command succeeds
    And all VMs in cluster "lab" are running talos version "v1.14.0"

  Scenario: upgrade fails if target version image is not available
    Given a cluster named "lab" exists and is fully bootstrapped
    When I run "h3ctl --cluster lab config set talos_version=v9.99.0"
    And I run "h3ctl --cluster lab --vm w0 talos upgrade"
    Then the command fails with "image not found"
