@integration
Feature: talos kubeconfig

  Background:
    Given integration prerequisites are available
    Given ~/.h3ctl already exists

  Scenario: kubeconfig fetches and writes kubeconfig to default path
    Given a cluster named "lab" exists and is fully bootstrapped
    When I run "h3ctl --cluster lab talos kubeconfig"
    Then the command succeeds
    And a kubeconfig exists for cluster "lab"

  Scenario: kubeconfig writes to a custom path with --out
    Given a cluster named "lab" exists and is fully bootstrapped
    When I run "h3ctl --cluster lab talos kubeconfig --out /tmp/lab.kubeconfig"
    Then the command succeeds
    And a file exists at "/tmp/lab.kubeconfig"

  Scenario: kubeconfig fails if cluster is not bootstrapped
    Given a cluster named "lab" exists
    And no VMs in cluster "lab" are running
    When I run "h3ctl --cluster lab talos kubeconfig"
    Then the command fails with "cluster not ready"
