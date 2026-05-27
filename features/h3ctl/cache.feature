Feature: h3ctl cache management

  Background:
    Given ~/.h3ctl already exists

  # list

  Scenario: cache list is empty when no images are cached
    Given the cache directory is empty
    When I run "h3ctl cache list"
    Then the command succeeds
    And stdout is empty

  Scenario: cache list shows cached images with size and cluster references
    Given a cached image exists for talos version "v1.13.0"
    And a cluster named "prod" references talos version "v1.13.0"
    When I run "h3ctl cache list"
    Then the command succeeds
    And stdout contains "v1.13.0"
    And stdout contains "prod"

  Scenario: cache list shows unreferenced images
    Given a cached image exists for talos version "v1.12.0"
    And no cluster references talos version "v1.12.0"
    When I run "h3ctl cache list"
    Then the command succeeds
    And stdout contains "v1.12.0"
    And stdout contains "unreferenced"

  # prune

  Scenario: prune removes unreferenced images
    Given a cached image exists for talos version "v1.12.0"
    And no cluster references talos version "v1.12.0"
    When I run "h3ctl cache prune --confirm"
    Then the command succeeds
    And no cached image exists for talos version "v1.12.0"

  Scenario: prune keeps images referenced by a cluster
    Given a cached image exists for talos version "v1.13.0"
    And a cluster named "prod" references talos version "v1.13.0"
    When I run "h3ctl cache prune --confirm"
    Then the command succeeds
    And a cached image exists for talos version "v1.13.0"

  Scenario: prune requires confirmation flag
    Given a cached image exists for talos version "v1.12.0"
    And no cluster references talos version "v1.12.0"
    When I run "h3ctl cache prune"
    Then the command fails with "requires --confirm"
    And a cached image exists for talos version "v1.12.0"

  # clear

  Scenario: clear removes all cached images
    Given a cached image exists for talos version "v1.13.0"
    And a cached image exists for talos version "v1.12.0"
    When I run "h3ctl cache clear --confirm"
    Then the command succeeds
    And the cache directory is empty

  Scenario: clear requires confirmation flag
    Given a cached image exists for talos version "v1.13.0"
    When I run "h3ctl cache clear"
    Then the command fails with "requires --confirm"
    And a cached image exists for talos version "v1.13.0"
