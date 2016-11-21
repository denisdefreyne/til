---
title: Thread.list
tags: ruby threads
---

Ruby has `Thread.list`, which returns a list of all threads in the current process:

```
irb> Thread.list
=> [#<Thread:0x007f8caa07f448 run>]

irb> Thread.new { sleep 1000 }
=> #<Thread:0x007f8ca988abc0@(irb):2 run>

irb> Thread.list
=> [
  #<Thread:0x007f8caa07f448 run>,
  #<Thread:0x007f8ca988abc0@(irb):2 sleep>]
```
