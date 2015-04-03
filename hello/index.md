# First Steps

It is traditional to start a book or tutorial
about a programming language
with a very simple example:
a program that just writes the text "Hello world!"
on the screen.
Here it is in Pike:

```pike
int main()
{
  write("Hello world!\n");
  return 0;
}
```

To run this program,
you will write it in a text file,
for example called "`hello.pike`",
and then run it.
If you are using a text-based interface,
such as a Unix command shell
or the Command Prompt Window in Windows NT,
you can run the program by typing the command
"`pike hello.pike`".

If you are using a graphical interface
where the file is shown as an icon,
such as the Windows Explorer,
or a graphical file manager in Unix,
you may be able to run the program
by dragging its icon and dropping it on the Pike interpreter,
or by double-clicking on the program icon.

All this assumes that Pike has been installed on your computer.

When you run the program, it will (surprise, surprise) print

```
Hello world!
```

on the screen.
(In a graphical environment,
this text may pop up in a separate window.)

## Explaining the "hello world" program

If we start in the middle of this program, the line

```pike
  write("Hello world!\n");
```

is the central part of the program.
We are using the built-in function `write`,
which prints text to the so-called **standard output**.
The standard output is usually the computer screen.

Between the parentheses after `write`
we have put the **arguments** that we send to the function.
In this case,
there is only one argument,
the text `"Hello world!\n"`.
The double quotes (`"`) signify that it is a **string**,
i e a sequence of characters.
The combination `\n` is translated to a **newline character**,
so the next thing that is printed on the screen
after the greeting
will come on a different line.

We cannot let a line like this stand by itself in a program.
It must be contained in a larger construct
called a **function**, or **method**.
We therefore enclose it in the method `main`:

```pike
int main()
{
  write("Hello world!\n");
}
```

This (as yet unfinished) program means
that there exists a method called `main`,
and that this method will print a greeting
to the standard output as explained before.
The `int` before `main` means that
(besides doing the printing)
the method will also return a value, an integer,
to whatever it is that uses it.
But we have not specified which value it will return,
so we add a line that does this,
finally yielding the complete program:

```pike
int main()
{
  write("Hello world!\n");
  return 0;
}
```

When Pike runs (or "executes") a file like this one,
it always starts by calling `main`.
When `main` is finished,
the program stops executing,
and the returned value is used to indicate
whether the program succeeded to do what it was supposed to do.
Returning the value 0 from `main` means success.

A semi-colon (`;`) signifies the end of a so-called **statement**.
This program contains two statements:
the use of `write`,
and the returning of a value.
In the good old days,
statements would have been called "program lines",
since you had to have a statement on each line,
but nowadays most programming languages
allow you to write in "free format",
dividing your program into lines
in any way that you feel makes it easy to read.
There are still some constraints:
you can't split words,
and you can't start a new line in the middle of a quoted string.
This is the same program as before,
but rearranged:

```pike
   int
main (   )    {write    (
"Hello world!\n"); return

    0;     }
```

Ok, those changes probably didn't make the program
easier to read and understand,
but there are many quite legitimate variations
in how programmers choose to write.
For example, this is another common style:

```pike
int main() {
  write("Hello world!\n");
  return 0;
}
```
