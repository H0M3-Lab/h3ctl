Feature: vm logs

  Background:
    Given ~/.h3ctl already exists
    And a cluster named "prod" exists with default config

  Scenario: logs prints the last 50 lines of VM console output
    Given vm "cp0" in cluster "prod" has log output
    When I run "h3ctl --cluster prod --vm cp0 vm logs"
    Then the command succeeds
    And stdout contains log content for vm "cp0"

  Scenario: logs -f follows output until interrupted
    Given vm "cp0" in cluster "prod" is running
    When I run "h3ctl --cluster prod --vm cp0 vm logs -f" with timeout
    Then the command streams output

  Scenario: logs fails if no log file exists
    Given vm "cp0" in cluster "prod" has no log file
    When I run "h3ctl --cluster prod --vm cp0 vm logs"
    Then the command fails with "no log file"
