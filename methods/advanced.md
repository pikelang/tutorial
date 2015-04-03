# More Advanced Examples

Here are two more examples of method definitions:

```pike
int getDex()
{
  int oldDex = Dex;
  Dex = 0;
  return oldDex;
}

private void
show_user(int|string id, void|string full_name)
{
  write("Id: " + id + "\n");
  if (full_name)
    write("Full name: " + full_name + "\n");
}
```

The method `getDex` returns the value of a non-local variable called `Dex`,
but also changes the value of that variable to zero (**0**).

The method `show_user` expects to receive either one or two arguments.
The first argument can be either an integer or a string.
The second argument is optional,
but if it is present it must be a string.

Here are some valid statements that contain calls to the two methods above:

```pike
getDex();
show_user(19);
show_user("john");
show_user(19, "John Doe");
show_user("john", "John Doe");
```

## Side-effects in Methods

When working with methods,
you may want to be careful with **side-effects**.
A side-effect is anything that the method causes to change or happen,
except for the returned value.
Sometimes the side-effects are the reason for the method,
and sometimes they are a dangerous misfeature.
In the three examples above,
`getDex` has the side-effect
of setting the value of the non-local variable `Dex` to 0,
and `show_user` has the side-effect
that it writes some text to the standard output.
We can guess that `show_user` has been created just to write that text,
so this side-effect of `show_user` is probably not a problem.
On the other hand,
if a programmer uses `getDex` to get the value of the variable `Dex`,
it could come as a surprise that this method also changes the value.
