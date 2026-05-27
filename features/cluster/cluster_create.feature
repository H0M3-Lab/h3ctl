Feature: cluster create

  Background:
    Given ~/.h3ctl already exists

  Scenario: create with default name
    Given no cluster named "h3-cluster" exists
    When I run "h3ctl cluster create"
    Then the command succeeds
    And a cluster directory exists for "h3-cluster"
    And the cluster config for "h3-cluster" contains cluster_name "h3-cluster"
    And the cluster config for "h3-cluster" contains host_backend matching current OS
    And the cluster config for "h3-cluster" contains host_service matching current OS

  Scenario: create with explicit name via --cluster
    Given no cluster named "prod" exists
    When I run "h3ctl --cluster prod cluster create"
    Then the command succeeds
    And a cluster directory exists for "prod"
    And the cluster config for "prod" contains cluster_name "prod"

  Scenario: create with --set applies config fields at creation
    Given no cluster named "prod" exists
    When I run "h3ctl --cluster prod cluster create --set talos_version=v1.14.0 --set network_iface=en1"
    Then the command succeeds
    And the cluster config for "prod" contains talos_version "v1.14.0"
    And the cluster config for "prod" contains network_iface "en1"

  Scenario: create initialises default VMs cp0, cp1, w0
    Given no cluster named "h3-cluster" exists
    When I run "h3ctl cluster create"
    Then the command succeeds
    And the cluster config for "h3-cluster" contains vm "cp0"
    And the cluster config for "h3-cluster" contains vm "cp1"
    And the cluster config for "h3-cluster" contains vm "w0"

  Scenario: create fails if cluster already exists
    Given a cluster named "prod" exists
    When I run "h3ctl --cluster prod cluster create"
    Then the command fails with "already exists"
