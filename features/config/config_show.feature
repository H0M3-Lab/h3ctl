Feature: config show

  Background:
    Given ~/.h3ctl already exists
    And a cluster named "prod" exists with default config

  Scenario: show prints the full cluster yaml
    When I run "h3ctl --cluster prod config show"
    Then the command succeeds
    And stdout contains "cluster_name: prod"
    And stdout contains "talos_version"
    And stdout contains "host_backend"

  Scenario: show with --vm prints only vm-level stored values
    When I run "h3ctl --cluster prod --vm cp0 config show"
    Then the command succeeds
    And stdout contains "cp0"

  Scenario: show --output json returns valid JSON
    When I run "h3ctl --cluster prod config show --output json"
    Then the command succeeds
    And stdout is valid JSON
    And JSON field "cluster_name" equals "prod"

  Scenario: show fails for unknown cluster
    When I run "h3ctl --cluster ghost config show"
    Then the command fails with "no cluster named"
