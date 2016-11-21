---
title: tee and sudo
tags: unix shell
---

`tee` is a command that passes everything from standard input into standard output, but also writes everything read from standard input to a file:

```
% echo hi | tee greeting.txt
hi
% cat greeting.txt
hi
```

`tee` becomes useful when you want to redirect as root. Imagine a read-only directory:

```
% sudo ls -l | grep restricted_files
drwxr-xr-x  2 root     staff     68 Nov 21 21:39 restricted_files/
```

Redirecting with `sudo` doesn’t work, because `sudo` does not affect redirection:

```
% sudo echo hi > restricted_files/greeting.txt
An error occurred while redirecting file 'restricted_files/greeting.txt'
open: Permission denied
```

Piping the command through `tee` run as root, however, does work:

```
% echo hi | sudo tee restricted_files/greeting.txt
hi
% cat restricted_files/greeting.txt
hi
```

As an added benefit, the original command is no longer being run as root.
