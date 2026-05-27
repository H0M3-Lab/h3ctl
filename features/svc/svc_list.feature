Feature: svc list

  Background:
    Given ~/.h3ctl already exists

  Scenario: list shows no services when no VMs are running
    Given no h3ctl-managed services are loaded on the host
    When I run "h3ctl svc list"
    Then the command succeeds
    And stdout is empty

  Scenario: list shows all loaded h3ctl services across all clusters
    Given a cluster named "prod" exists and vms "cp0", "w0" are running
    And a cluster named "dev" exists and vm "cp0" is running
    When I run "h3ctl svc list"
    Then the command succeeds
    And stdout contains "prod"
    And stdout contains "dev"
    And stdout contains "cp0"
    And stdout contains "w0"

  Scenario: svc stop-all unloads all h3ctl-managed services
    Given a cluster named "prod" exists and vms "cp0", "w0" are running
    When I run "h3ctl svc stop-all"
    Then the command succeeds
    And no h3ctl-managed services are loaded on the host

  Scenario: svc stop-all when no services are running succeeds silently
    Given no h3ctl-managed services are loaded on the host
    When I run "h3ctl svc stop-all"
    Then the command succeeds
