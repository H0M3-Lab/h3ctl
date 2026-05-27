## h3ctl vm wait-api

Block until the Talos API is reachable on a booting VM

```
h3ctl vm wait-api [flags]
```

### Options

```
  -h, --help             help for wait-api
      --timeout string   maximum time to wait (e.g. 5m, 300s) (default "5m")
```

### Options inherited from parent commands

```
      --cluster string   target cluster (overrides active context)
      --output string    output format: text|json (default "text")
      --vm string        target VM (used with vm/config/talos/svc commands)
```

### SEE ALSO

* [h3ctl vm](h3ctl_vm.md)	 - Individual VM control (poweruser primitives)

