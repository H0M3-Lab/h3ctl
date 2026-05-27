## h3ctl svc

Host service manager control (launchd/systemd) — poweruser commands

### Options

```
  -h, --help   help for svc
```

### Options inherited from parent commands

```
      --cluster string   target cluster (overrides active context)
      --output string    output format: text|json (default "text")
      --vm string        target VM (used with vm/config/talos/svc commands)
```

### SEE ALSO

* [h3ctl](h3ctl.md)	 - h3ctl — local Talos cluster manager
* [h3ctl svc list](h3ctl_svc_list.md)	 - List all h3ctl-managed services loaded on the host (across all clusters)
* [h3ctl svc load](h3ctl_svc_load.md)	 - Load the service file for a VM into the host service manager
* [h3ctl svc reload](h3ctl_svc_reload.md)	 - Unload and reload a VM service without touching disk or logs
* [h3ctl svc show](h3ctl_svc_show.md)	 - Print the contents of the generated service file for a VM
* [h3ctl svc stop-all](h3ctl_svc_stop-all.md)	 - Emergency unload of all h3ctl-managed services on the host
* [h3ctl svc unload](h3ctl_svc_unload.md)	 - Unload the service for a VM from the host service manager
* [h3ctl svc write](h3ctl_svc_write.md)	 - Write the service file for a VM to disk without loading it

