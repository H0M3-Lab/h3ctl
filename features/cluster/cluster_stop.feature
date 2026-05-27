@integration
Feature: cluster stop

  Background:
    Given integration prerequisites are available
    Given ~/.h3ctl already exists

  Scenario: stop halts all running VMs in the cluster
    Given a cluster named "lab" exists and all VMs are running
    When I run "h3ctl --cluster lab cluster stop"
    Then the command succeeds
    And no VMs in cluster "lab" are running

  Scenario: stop on an already-stopped cluster succeeds silently
    Given a cluster named "lab" exists
    And no VMs in cluster "lab" are running
    When I run "h3ctl --cluster lab cluster stop"
    Then the command succeeds
