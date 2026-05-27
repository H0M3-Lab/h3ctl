## h3ctl vm

Individual VM control (poweruser primitives)

### Options

```
  -h, --help   help for vm
```

### Options inherited from parent commands

```
      --cluster string   target cluster (overrides active context)
      --output string    output format: text|json (default "text")
      --vm string        target VM (used with vm/config/talos/svc commands)
```

### SEE ALSO

* [h3ctl](h3ctl.md)	 - h3ctl — local Talos cluster manager
* [h3ctl vm boot](h3ctl_vm_boot.md)	 - Create disk image, write service file, and start the VM
* [h3ctl vm create](h3ctl_vm_create.md)	 - Allocate a disk image for the VM without booting it
* [h3ctl vm delete](h3ctl_vm_delete.md)	 - Remove disk image, service file, and IP cache for a stopped VM
* [h3ctl vm ip](h3ctl_vm_ip.md)	 - Print the cached IP of a VM, waiting if it is still booting
* [h3ctl vm logs](h3ctl_vm_logs.md)	 - Print VM console output (last 50 lines by default)
* [h3ctl vm rename](h3ctl_vm_rename.md)	 - Rename a stopped VM (moves disk and service files, updates yaml key)
* [h3ctl vm status](h3ctl_vm_status.md)	 - Show the running state of a VM (stopped|maintenance|running)
* [h3ctl vm stop](h3ctl_vm_stop.md)	 - Halt a running VM and clear its cached IP
* [h3ctl vm wait-api](h3ctl_vm_wait-api.md)	 - Block until the Talos API is reachable on a booting VM

