## h3ctl cluster

Cluster lifecycle commands

### Options

```
  -h, --help   help for cluster
```

### Options inherited from parent commands

```
      --cluster string   target cluster (overrides active context)
      --output string    output format: text|json (default "text")
      --vm string        target VM (used with vm/config/talos/svc commands)
```

### SEE ALSO

* [h3ctl](h3ctl.md)	 - h3ctl — local Talos cluster manager
* [h3ctl cluster create](h3ctl_cluster_create.md)	 - Create a new cluster directory and h3.yaml with defaults
* [h3ctl cluster delete](h3ctl_cluster_delete.md)	 - Delete a stopped cluster's directory and config
* [h3ctl cluster destroy](h3ctl_cluster_destroy.md)	 - Stop VMs, wipe disks, remove services, and delete cluster directory
* [h3ctl cluster kubeconfig](h3ctl_cluster_kubeconfig.md)	 - Fetch kubeconfig from a bootstrapped cluster
* [h3ctl cluster rename](h3ctl_cluster_rename.md)	 - Rename a stopped cluster (moves directory, rewrites cluster_name in yaml)
* [h3ctl cluster start](h3ctl_cluster_start.md)	 - Boot all VMs, apply Talos config, and bootstrap the cluster
* [h3ctl cluster status](h3ctl_cluster_status.md)	 - Show the running status of all VMs in the cluster
* [h3ctl cluster stop](h3ctl_cluster_stop.md)	 - Stop all running VMs in the cluster

