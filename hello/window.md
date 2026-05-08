# I Want My Greeting in a Window!

Pike has support for graphical user interfaces.
If you have the GTK Pike module installed on your computer,
you can use a slightly modified program to print "Hello world!"
in its own window:

```pike
int main()
{
  GTK.setup_gtk();
  GTK.Alert("Hello world!");
  return -1;
}
```

The statement "`GTK.setup_gtk();`" is a call to a method,
similar to the call to `write` in our first example.
The difference here is that `setup_gtk`
is found in a module called `GTK`,
so we must prefix it with "`GTK.`"
to let Pike know where to look for it.

The next statement, "`GTK.Alert("Hello world!");`",
creates a small window, an "alert window",
with the text "Hello world!" in it.
The window will look something like this:

![alertwindow](alertwindow.gif)

*The window that pops up when the GTK hello-world program is run*

When you click on the "OK" button,
the window disappears.

The last statement in `main` is "`return -1;`".
In Pike, a negative return value from `main` means
that the program doesn't stop executing when `main` is finished.
This is necessary here,
since otherwise the program would finish
as soon as it had created the window,
and the window would disappear at once.

But there is a problem with this program.
The program doesn't stop executing when `main` is finished,
so when does it stop?
Never.
We may close the window,
but the program is still running.
It doesn't actually do anything,
but it is there.

We can fix the problem like this:

```pike
int main()
{
  GTK.setup_gtk();
  GTK.Alert("Hello world!")
    -> signal_connect("destroy", lambda(){ exit(0); });
  return -1;
}
```

To explain this, think that

```pike
GTK.Alert("Hello world!")
```

creates the Alert window.
The Alert window is a thing, or an "object".
It not only pops up on your computer screen,
but you can also let your program do things with this object.
For example,
you can tell the window that when it is destroyed,
it should order the entire program to exit.
This is what the rest of of the statement does
(even if we don't explain the exact details here):

```pike
-> signal_connect("destroy", lambda(){ exit(0); });
```
