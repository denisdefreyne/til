---
title: Moving the terminal cursor
tags: unix shell
---

When you write stuff to the terminal, characters are printed from left to right, and wrap around the right hand side of the terminal onto the next line if necessary. That’s how a terminal typically works, but a terminal is also a matrix—each character position in the terminal has X and Y coordinates—and there are ways to write text at arbitrary positions, and thus use the terminal as a drawing board.

The way to do this is by writing the _control sequence introducer_ (CSI) `\e[`, followed by instructions that describe what precisely you want to do.

A CSI followed by the character `B` will move the cursor down a single line. For example, the following Ruby code

```
puts "hello\e[Bworld"
```

will print

```
hello
     world
```

`A` moves the cursor up, `B` moves it down, `C` moves it right, and `D` moves it left.

You can prefix it with a number to make it move the given distance:

```
puts "hello\e[10Cworld"
```

```
hello          world
```

`G` moves it to the beginning or the line, or to the given column if you give it a number:

```
puts "2 + 3 = 7\e[G4"
```

```
4 + 3 = 7
```

`K` erases all characters after the cursor. For example:

```
(1..3).cycle.each do |num|
  $stdout << '.' * num << "\e[K" << "\e[G"
  sleep 0.2
end
```

will forever print dots:

<pre><span class="blink-1">.</span><span class="blink-2">.</span><span class="blink-3">.</span></pre>
