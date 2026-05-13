# I Want My Greeting in a Window!

Pike has support for graphical user interfaces.
If you have the GTK2 or GI Pike modules installed on your computer,
you can use a slightly modified program to print "Hello world!"
in its own window:

## Using the *GTK2* module:
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

## Using the *GI* module to do the same with Gtk 3.0 or 4.0:

The `GI` module uses GObject-Introspection to load compatible APIs.
It can be used to access Gtk3 or Gtk4. You can either use the syntax
`GI.repository.Gtk` (which loads the newest version available version
of Gtk), or the following to specify that you want a specific version
`GI.repository.4.0.Gtk`.

Gtk 3.0 and later require using the backend from GLib, which is
easiest to do via `Gtk.Application`:

```pike
import GI.repository;

void got_activate(Gtk.Application app)
{
  Gtk.AlertDialog alert = Gtk.AlertDialog();
  alert->set_message("Hello world!");
  alert->show(UNDEFINED);
}

int main(int argc, array(string) argv)
{
  Gtk.Application app = Gtk.Application(([
    "application_id": "apps.pike.hello_window",
  ]));
  app->connect("activate", got_activate);
  app->run(argc, argv);
}
```

If you run the above you may note that a window shows up briefly
and then the program terminates. This is due to `Gtk.Application()->run()`
terminating its event loop as soon as there are no windows left.

This can be fixed by adding a call of `app->hold()` to `got_activate()`:

```pike
void got_activate(Gtk.Application app)
{
  app->hold();
  Gtk.AlertDialog alert = Gtk.AlertDialog();
  alert->set_message("Hello world!");
  alert->show(UNDEFINED);
}
```

The window will now stay around until the *Close* button is pressed.
Now however we have a different issue in that `app->run()` does not
terminate when the window is closed.

This can be fixed by using `alert->choose()` instead of `alert->show()`
and use it to register a function to be called when the button is clicked,
and have that function release the hold on the app:

```pike
import GI.repository;

void got_alert_res(Gtk.AlertDialog alert, Gio.Task res, Gtk.Application app)
{
  app->release();
}

void got_activate(Gtk.Application app)
{
  app->hold();
  Gtk.AlertDialog alert = Gtk.AlertDialog();
  alert->set_message("Hello world!");
  alert->choose(UNDEFINED, UNDEFINED, got_alert_res, app);
}

int main(int argc, array(string) argv)
{
  Gtk.Application app = Gtk.Application(([
    "application_id": "apps.pike.hello_window",
  ]));
  app->connect("activate", got_activate);
  app->run(argc, argv);
}
```

You may note that some functions have been renamed compared to GTK2;
eg `signal_connect()` and `Alert` are `connect()` and `AlertDialog`
respectively in Gtk 3.0 and later. Converting code from using the
`GTK2` module to using a more recent version of Gtk via the `GI`
module or writing code to support both is not trivial, so you
typically select to support one or the other, and considering that
many OS distributions no longer provide support for GTK2, the choice
should be obvious.
