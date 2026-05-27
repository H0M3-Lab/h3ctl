Feature: vm ip

  Background:
    Given ~/.h3ctl already exists
    And a cluster named "prod" exists with default config

  Scenario: ip returns the cached IP for a running VM
    Given vm "cp0" in cluster "prod" is running with IP "192.168.1.100"
    When I run "h3ctl --cluster prod --vm cp0 vm ip"
    Then the command succeeds
    And stdout contains "192.168.1.100"

  Scenario: ip waits and returns IP when VM is booting
    Given vm "cp0" in cluster "prod" is booting and will get IP "192.168.1.100"
    When I run "h3ctl --cluster prod --vm cp0 vm ip"
    Then the command succeeds
    And stdout contains "192.168.1.100"

  Scenario: ip fails if VM is stopped and has no cached IP
    Given vm "cp0" in cluster "prod" is not running
    And no cached IP exists for vm "cp0" in cluster "prod"
    When I run "h3ctl --cluster prod --vm cp0 vm ip"
    Then the command fails with "no IP available"
