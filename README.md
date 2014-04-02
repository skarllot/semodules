##semodules

Custom modules for SELinux.

###Install

```
make
semodule -i *.pp
```

###Update

```
make
semodule -u *.pp
```

###Disable

```
semodule -d MODULE_NAME
```

###Remove

```
semodule -u MODULE_NAME
```

