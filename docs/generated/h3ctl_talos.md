## h3ctl talos

Talos OS poweruser primitives (genconfig, apply, bootstrap, upgrade)

### Options

```
  -h, --help   help for talos
```

### Options inherited from parent commands

```
      --cluster string   target cluster (overrides active context)
      --output string    output format: text|json (default "text")
      --vm string        target VM (used with vm/config/talos/svc commands)
```

### SEE ALSO

* [h3ctl](h3ctl.md)	 - h3ctl — local Talos cluster manager
* [h3ctl talos apply-config](h3ctl_talos_apply-config.md)	 - Apply Talos machine config to a VM in maintenance mode
* [h3ctl talos bootstrap](h3ctl_talos_bootstrap.md)	 - Bootstrap etcd on the first controlplane VM
* [h3ctl talos genconfig](h3ctl_talos_genconfig.md)	 - Generate Talos machine configs for all VMs in the cluster
* [h3ctl talos kubeconfig](h3ctl_talos_kubeconfig.md)	 - Fetch kubeconfig via talosctl and write to disk
* [h3ctl talos upgrade](h3ctl_talos_upgrade.md)	 - Upgrade Talos on a single VM to the version set in cluster config

