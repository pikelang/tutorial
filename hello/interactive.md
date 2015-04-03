# Interactive Pike

You can use Pike interactively,
which means that you type a line at a time,
letting Pike execute it immediately.
Just start Pike by giving the command `pike`,
without any command line arguments.
Then type a statement, for example:

```
> pike
Pike v8.0 release 28 running Hilfe v3.5 (Incremental Pike Frontend)
> write("hello!\n");
```

Pike will then do what you told it to do,
i e print "hello!" on a line:

```
> pike
Pike v8.0 release 28 running Hilfe v3.5 (Incremental Pike Frontend)
> write("hello!\n");
hello!
```

Similar to `main`, the built-in function `write` returns a value,
which happens to be the number of characters it has written.
Interactive Pike will also show you this return value:

```
> pike
Pike v8.0 release 28 running Hilfe v3.5 (Incremental Pike Frontend)
> write("hello!\n");
hello!
(1) Result: 7
>
```

The return value from write is the number of characters written,
which in this case is seven characters;
`h`, `e`, `l`, `l`, `o`, the exclamation mark, and the newline character.
The one in parenthesis at the beginning of the line
tells you that this is the first result in the session's history,
if you want to refer to it in subsequent expressions.

```
> pike
Pike v8.0 release 28 running Hilfe v3.5 (Incremental Pike Frontend)
> "hello";
(1) Result: "hello"
> _;
(2) Result: "hello"
> _ + " world!";
(3) Result: "hello world!"
> __[1];
(4) Result: "hello"
```

For convenience,
the interactive pike session offers two automatic variables:
`_`, which holds the most recent result, and
`__`, which lets you index out any result in session history by id.

Running Pike interactively like this
can be very useful when testing things,
for example when you are following this tutorial.
It can also be used as a very advanced calculator.
*But beware!
Some things don't work the same way in interactive mode
as they do when you run a Pike program from a file!*
