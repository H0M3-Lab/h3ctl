Feature: cluster status

  Background:
    Given ~/.h3ctl already exists

  Scenario: status shows all VMs stopped when cluster is not running
    Given a cluster named "prod" exists with vms "cp0", "cp1", "w0"
    And no VMs in cluster "prod" are running
    When I run "h3ctl --cluster prod cluster status"
    Then the command succeeds
    And stdout contains "cp0"
    And stdout contains "cp1"
    And stdout contains "w0"
    And stdout contains "stopped"

  Scenario: status shows running for running VMs
    Given a cluster named "prod" exists with vms "cp0", "w0"
    And all VMs in cluster "prod" are running
    When I run "h3ctl --cluster prod cluster status"
    Then the command succeeds
    And stdout contains "cp0"
    And stdout contains "w0"
    And stdout contains "running"

  Scenario: status --output json returns valid JSON
    Given a cluster named "prod" exists with vms "cp0", "w0"
    When I run "h3ctl --cluster prod cluster status --output json"
    Then the command succeeds
    And stdout is valid JSON

  Scenario: status fails for unknown cluster
    When I run "h3ctl --cluster ghost cluster status"
    Then the command fails with "no cluster named"
