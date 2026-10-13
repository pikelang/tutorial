# How Do You Use a Module?

To use a member of a module, just prefix the member name with the
module name and a dot. For example, we have already used the standard
input, which is called `Stdio.stdin`. That means that it is the
member `stdin` in the module `Stdio`. In this example,
we read a string from the standard input by calling the method
`gets` in the object `Stdio.stdin`:

```pike
string name = Stdio.stdin->gets();
```

We have also used the class `Protocols.HTTP.Query`, which is
the member `Query` in the module `Protocols.HTTP`. Note
that the module `Protocols.HTTP` is actually the module
`HTTP`, which is a member of the module `Protocols`. In
this example, we use the class `Protocols.HTTP.Query` as the
data type when defining a variable:

```pike
Protocols.HTTP.Query web_page;
```

If we don't want to write the module name every time we use
something from that module, we can **import** the module.

```pike
import Stdio;
import Protocols.HTTP;
```

After importing those two modules, we can use both `stdin`
and `Query` without prefixing them with anything:

```pike
string name = stdin->gets();
Query web_page;
```

Importing can be done anywhere in a program,
but we usually do it at the top of the program.

If we import two modules that contain the same name, that name will
refer to the module that was imported latest. An example where the
modules `canvas_window` and `chess_game` both contain
the method `draw`:

```pike
import canvas_window;
draw(); // Lets you draw pictures
import chess_game;
draw(); // A draw in a chess game: nobody wins
```

Even if you have imported a module, you can use the module name to
determine which module you mean:

```pike
canvas_window.draw(); // Lets you draw pictures
```

You can import all the modules in a directory by giving the
directory name as a string:

```pike
import "/home/blubbers/pike/all_my_modules";
```

If you refer to a module with the module name prefixed by just a
dot, Pike will look for the module in the same directory as the
program that used the module:

```pike
import .florble;
.gnooble.droop(7, 3);

```
