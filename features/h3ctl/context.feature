Feature: h3ctl context management

  Background:
    Given ~/.h3ctl already exists

  # list

  Scenario: list shows empty when no clusters exist
    Given no clusters exist
    When I run "h3ctl list"
    Then the command succeeds
    And stdout is empty

  Scenario: list shows all clusters
    Given a cluster named "alpha" exists
    And a cluster named "beta" exists
    When I run "h3ctl list"
    Then the command succeeds
    And stdout contains "alpha"
    And stdout contains "beta"

  # active

  Scenario: active returns nothing when no cluster is set
    Given no active cluster is set
    When I run "h3ctl active"
    Then the command succeeds
    And stdout is empty

  Scenario: active returns the current active cluster
    Given a cluster named "alpha" exists
    And active cluster is set to "alpha"
    When I run "h3ctl active"
    Then the command succeeds
    And stdout contains "alpha"

  # use

  Scenario: use sets the active cluster
    Given a cluster named "alpha" exists
    And no active cluster is set
    When I run "h3ctl use alpha"
    Then the command succeeds
    And active cluster is "alpha"

  Scenario: use overwrites the previous active cluster
    Given a cluster named "alpha" exists
    And a cluster named "beta" exists
    And active cluster is set to "alpha"
    When I run "h3ctl use beta"
    Then the command succeeds
    And active cluster is "beta"

  Scenario: use fails for a cluster that does not exist
    Given no cluster named "ghost" exists
    When I run "h3ctl use ghost"
    Then the command fails with "no cluster named"

  # unuse

  Scenario: unuse clears the active cluster
    Given a cluster named "alpha" exists
    And active cluster is set to "alpha"
    When I run "h3ctl unuse"
    Then the command succeeds
    And no active cluster is set

  Scenario: unuse with cluster name clears active when it matches
    Given a cluster named "alpha" exists
    And active cluster is set to "alpha"
    When I run "h3ctl unuse alpha"
    Then the command succeeds
    And no active cluster is set

  Scenario: unuse when no active cluster is set succeeds silently
    Given no active cluster is set
    When I run "h3ctl unuse"
    Then the command succeeds

  # --cluster flag overrides active

  Scenario: --cluster flag targets a different cluster than active
    Given a cluster named "alpha" exists
    And a cluster named "beta" exists
    And active cluster is set to "alpha"
    When I run "h3ctl --cluster beta cluster status"
    Then the command succeeds
    And active cluster is still "alpha"
