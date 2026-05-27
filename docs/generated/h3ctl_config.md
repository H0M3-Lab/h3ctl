## h3ctl config

Read and write cluster and VM configuration (h3.yaml)

### Options

```
  -h, --help   help for config
```

### Options inherited from parent commands

```
      --cluster string   target cluster (overrides active context)
      --output string    output format: text|json (default "text")
      --vm string        target VM (used with vm/config/talos/svc commands)
```

### SEE ALSO

* [h3ctl](h3ctl.md)	 - h3ctl — local Talos cluster manager
* [h3ctl config get](h3ctl_config_get.md)	 - Get a single config field value, with override fallback
* [h3ctl config resolve](h3ctl_config_resolve.md)	 - Show the fully merged effective config for a VM (requires --vm)
* [h3ctl config set](h3ctl_config_set.md)	 - Set one or more config fields (supports vms.<key>.<field> dot-path syntax)
* [h3ctl config show](h3ctl_config_show.md)	 - Print stored yaml for the cluster (or a single VM with --vm)
* [h3ctl config unset](h3ctl_config_unset.md)	 - Remove one or more config overrides, restoring the parent-level default

