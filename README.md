Playground
==========

Quickly spin up a [k3s](https://k3s.io/) test cluster in an ubuntu vm.
Complete with `kubectl` symlinked to `k3s kubectl` and with [kubectx](https://github.com/ahmetb/kubectx) installed
by default for the vagrant user.

## Getting started
To start up the VM:

```
$ vagrant up
```

To connect:
```
$ vagrant ssh

```

Go ahead and use `kubectl`, `kubens` and `kubectx` like you would normally.
