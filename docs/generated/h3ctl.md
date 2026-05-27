## h3ctl

h3ctl — local Talos cluster manager

### Synopsis

Dummy-friendly cluster workflows built from the same VM and Talos primitives exposed to power users.

### Options

```
      --cluster string   target cluster (overrides active context)
  -h, --help             help for h3ctl
      --output string    output format: text|json (default "text")
      --vm string        target VM (used with vm/config/talos/svc commands)
```

### SEE ALSO

* [h3ctl active](h3ctl_active.md)	 - Print the currently active cluster, or nothing if none is set
* [h3ctl cache](h3ctl_cache.md)	 - Manage the local Talos image cache (~/.h3ctl/cache/images)
* [h3ctl cluster](h3ctl_cluster.md)	 - Cluster lifecycle commands
* [h3ctl config](h3ctl_config.md)	 - Read and write cluster and VM configuration (h3.yaml)
* [h3ctl destroy](h3ctl_destroy.md)	 - Wipe ~/.h3ctl entirely (all clusters, cache, and state)
* [h3ctl init](h3ctl_init.md)	 - Initialise ~/.h3ctl with the required directory structure
* [h3ctl list](h3ctl_list.md)	 - List all clusters in ~/.h3ctl
* [h3ctl svc](h3ctl_svc.md)	 - Host service manager control (launchd/systemd) — poweruser commands
* [h3ctl talos](h3ctl_talos.md)	 - Talos OS poweruser primitives (genconfig, apply, bootstrap, upgrade)
* [h3ctl unuse](h3ctl_unuse.md)	 - Clear the active cluster context
* [h3ctl use](h3ctl_use.md)	 - Set the active cluster context
* [h3ctl vm](h3ctl_vm.md)	 - Individual VM control (poweruser primitives)

