# Reading this Tutorial

This tutorial gives an introduction to the language Pike. It is not
a complete reference manual. It does not document the modules and
libraries that come with the Pike distribution, except for what is
necessary to explain the workings of the language itself. We also
assume that Pike has already been installed on your computer. How to
install Pike is explained elsewhere.

The tutorial is mainly intended for people with at least some
experience of programming, for example from writing some JavaScript on
a web page, or trying to write CGI scripts on a web server in some
language. We assume that you now have a need for, or just an interest
in, using Pike. We also assume that you are willing to spend a few
hours on reading this introduction. We recommend that you try to run
the examples as you read them, since this will help your learning
greatly.

Even total beginners at programming will be able to understand much
of what is said. If you have never programmed before it is
nevertheless a good idea to read a book or tutorial intended for
beginners. There are some general skills and ways of thinking that are
needed to write good programs, and a language tutorial such as this
one will not cover those in any depth.

We have tried to make this tutorial platform-independent, meaning
that it will not matter if you are using Pike under Linux, Solaris,
Windows NT, or some other operating system.

The following conventions for type faces are used:

* **Boldface** is used for terms that have a special meaning.
  Example:

  A **variable** can be seen as a sort of box where you can store a value.
  It can also be used to show values, such as **7.3**.

* `Fixed size` is used for something that is copied verbatim from the computer.
  It can be parts of a program,
  or something printed by the computer,
  or something typed by the user.
  Example:

  In Pike, the datatype integer is spelled `int`.

* *Italics* can be used for emphasis, but also as a placeholder
  for other things.
  Example:

  In Pike, you can define a variable with "*datatype* *name*;",
  where you replace *name* with the name of the variable,
  and *datatype* with its type.

* A bordered section of fixed-size text
  represents an interactive session,
  where user input is prefixed with a `> ` prompt.
  The rest of the session's text is program output:

```hilfe
Hello, professor.
I see you brought the keys to the ferarri.
> run project 21
Warming up particle accelerator...
```

* A bordered section of fixed-size, syntax-highlighted text
  represents pike code.
  Sometimes changes are highlighted with an end-of-line comment:

```pike
void example()
{
  write("Hello!\n"); // This line was changed from the previous example
}
```
