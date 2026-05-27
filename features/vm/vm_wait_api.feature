@integration
Feature: vm wait-api

  Background:
    Given integration prerequisites are available
    Given ~/.h3ctl already exists

  Scenario: wait-api returns when Talos API becomes available
    Given a cluster named "lab" exists
    And vm "cp0" in cluster "lab" is booting with Talos API coming up
    When I run "h3ctl --cluster lab --vm cp0 vm wait-api"
    Then the command succeeds

  Scenario: wait-api fails if VM is not running
    Given a cluster named "lab" exists
    And vm "cp0" in cluster "lab" is not running
    When I run "h3ctl --cluster lab --vm cp0 vm wait-api"
    Then the command fails with "vm not running"

  Scenario: wait-api times out if API does not become available
    Given a cluster named "lab" exists
    And vm "cp0" in cluster "lab" is running but Talos API never becomes available
    When I run "h3ctl --cluster lab --vm cp0 vm wait-api --timeout 5s"
    Then the command fails with "timeout"

  Scenario: wait-api fails for unknown VM
    When I run "h3ctl --cluster lab --vm ghost vm wait-api"
    Then the command fails with "no vm named"
