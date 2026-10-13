# `catch` and `throw`

It is not uncommon that we want to separate the detection and the
handling of errors. The place where an error can be detected is not
always the place where it is best to handle the error. Take for
example the method `Protocols.HTTP.get_url`. It is easy for
that method to detect when a web page couldn't be retrieved, but how
should that problem be handled? This depends on the program that
wanted the web page, so `get_url`, which is in a module that
will be used by many programs, can't know what to do. Instead, it
returns the value 0, in order to inform the calling program that it
failed, and thereby it leaves the responsibility for handling the
problem to the calling program.

Many methods work this way: you have to check the returned value to
see if the method succeeded or not. If you don't let your program
check every return value from every method call, an error may be
detected and reported by one of those methods, but never handled.
Depending on what type of error it was, all kinds of unpleasant things
can happen.

An improvement over this "return-value checking" style of error
handling is **exceptions**. When a problem is detected, perhaps
inside a method somewhere deep inside a module, the code can **throw
an exception**:

```pike
if (result_of_something == 0)
  throw("Failed to open the file called '" +
        file_name + "'\n");
```

If this is all that is done, the program will be terminated. But
the thing is that you can't only **throw** an exception, you can
**catch** it too! This is done by enclosing the code that called
the exception-throwing method in a **catch block**:

```pike
  mixed result = catch {
    i = klooble() + 2;
    fnooble();
    j = 1/i;
  };
  if (result == 0)
    write("Everything was ok.\n");
  else
    write("Oops. There was an error.\n");
```

Note that the catch block is an **expression**, unlike ordinary
blocks which are **statements**, so we have to use a semi-colon to
end the **expression statement**.

If no exceptions are thrown during the execution of the catch
block, it just executes to the end like any normal block. The block
returns a value, which in our example will be put in the variable
`result`. If no exceptions are thrown, the return value from
the catch block is 0.

If an exception *was* thrown, either in the catch block
itself, or in one of the methods called from the catch block, or in
one of the methods called from those methods, and so on, then
execution of the catch block will terminate, and the return value of
the catch block will be the argument that was given to `throw`,
in our case the string `"Failed to open the file called '*some
file-name*'\n"`.

A good thing with exceptions is that they can be thrown "through" a
method. Even if that method doesn't do any error checking at all, the
exception will be propagated to the caller. An an example, study this
partial program:

```pike
void drink_coffee()
{
  if (coffe_pot == 0)
    throw("No coffe-pot.");
}

void eat_dinner()
{
  eat_main_course();
  eat_dessert();
  drink_coffee();
}

int main()
{
  mixed result = catch {
    eat_dinner();
  };
  if (result == 0)
    write("Everything was ok.\n");
  else
    write("There was an error: " + result + "\n");

  return 0;
}
```

The method `main` calls `eat_dinner`, which in turn
calls `drink_coffee`. If `drink_coffee` discovers that
the coffee-pot is missing, it will throw an exception. This exception
will pass right through `eat_dinner`, and be caught in
`main`.

If we hadn't used exceptions, but return codes instead, and if we
assume that things can go wrong in all the methods, then
`eat_dinner` would have looked something like this:

```pike
int eat_dinner()
{
  if (eat_main_course() == 0)
    return 0;
  if (eat_dessert() == 0)
    return 0;
  if (drink_coffee() == 0)
    return 0;
  return 1;
}
```

As we can see, the version with exceptions is much simpler and
easier, both to write and to understand.

## Built-in exceptions

The Pike interpreter can throw its own exceptions. For example, an
attempt to divide by zero will throw an exception. Most of these
"internal" exceptions are objects, with a number of methods and member
variables that you can use to determine the nature of the problem that
caused the exception.

If the caught exception is an object, you can use the member
variable `error_type` for the name of the type of this error,
for example `"math_error"`. You can also use the method
`describe` in the exception object, to get a string with a
short descriptive text, that presents the error in a way suitable for
presenting to a human: the error message, and the chain of methods
that were called. Look at this excerpt from a method for an
example:

```pike
mixed result = catch {
  koogle(0, 3.0, "foo");
};

if (result == 0)
  write("Everything was ok.\n");
else if (objectp(result))
{
  write("There was an error.\n");
  write("Type of error: " + result->error_type + "\n");
  write("Description of the error:\n");
  write(result->describe());
  write("Done.\n");
}
else {
  write("There was some other type of error.\n");
}

```
