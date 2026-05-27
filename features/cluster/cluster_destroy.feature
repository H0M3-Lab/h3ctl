@integration
Feature: cluster destroy

  Background:
    Given integration prerequisites are available
    Given ~/.h3ctl already exists

  Scenario: destroy stops VMs, removes disks, removes services, removes cluster directory
    Given a cluster named "lab" exists and all VMs are running
    When I run "h3ctl --cluster lab cluster destroy"
    Then the command succeeds
    And no VMs in cluster "lab" are running
    And no disk images exist for cluster "lab"
    And no service files exist for cluster "lab"
    And no cluster directory exists for "lab"

  Scenario: destroy on a stopped cluster removes all artifacts
    Given a cluster named "lab" exists
    And no VMs in cluster "lab" are running
    When I run "h3ctl --cluster lab cluster destroy"
    Then the command succeeds
    And no cluster directory exists for "lab"
