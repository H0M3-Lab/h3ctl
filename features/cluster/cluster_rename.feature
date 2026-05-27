Feature: cluster rename

  Background:
    Given ~/.h3ctl already exists

  Scenario: rename moves cluster directory and updates cluster_name in config
    Given a cluster named "prod" exists
    And no VMs in cluster "prod" are running
    When I run "h3ctl --cluster prod cluster rename staging"
    Then the command succeeds
    And a cluster directory exists for "staging"
    And the cluster config for "staging" contains cluster_name "staging"
    And no cluster directory exists for "prod"

  Scenario: rename fails if cluster is running
    Given a cluster named "prod" exists
    And vm "cp0" in cluster "prod" is running
    When I run "h3ctl --cluster prod cluster rename staging"
    Then the command fails with "cluster is running"

  Scenario: rename fails if target name already exists
    Given a cluster named "prod" exists
    And a cluster named "staging" exists
    When I run "h3ctl --cluster prod cluster rename staging"
    Then the command fails with "already exists"
