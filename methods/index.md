# An Introduction

## Methods

Most programming languages allow you
to divide your program into smaller parts.
These can be called
"sub-routines", "procedures", "functions" or "methods".
In Pike, we use the term "method".
Other parts of the program can **call** the method,
i e cause it to be executed.

## How to create a method

To create a method,
you must **define** it,
with a **method definition**.
A method definition follows this template:

```pike
*access-modifiers* *type* *method-name*( *parameter-list* )
*method-body*
```

Here is a description of the various parts in the definition template:

* The *access-modifiers* are optional.
  If they are present,
  they control from where this method can be called.
  An example of an access-modifier is `private`,
  which makes it impossible for other programs to call this method.

* The *type* is a **data type**,
  which specifies the type of the value that the method returns.
  It is sometimes called the "return type of the method",
  or the "type of the method".
  An example of a data type is `string`.
  If the type is `void`,
  the method is not supposed to return a value.

* The *method-name* is the name of the method.
  This is an identifier,
  for example `plus`, `destroy_all_enemy_ships` or `mUndoLatestChange`.
  A method should have a name
  that correctly describes what the method does:
  a method that prints a list of customers
  should probably be called something like `print_customers`.

* The *parameter-list* is a comma-separated list
  of the parameters of the method.
  A **parameter** acts like a variable,
  which is local in the method,
  and which gets the corresponding argument value
  from the method call as its initial value.
  Some examples of parameters are
  "`int number_of_cars`" and "`string name`".
  A method can have up to 256 parameters.
  If the method doesn't expect to receive any argument values,
  the *parameter-list* can be empty.

* The *method-body* is a **block**,
  and can contain statements and local definitions.

Sometimes we talk of the **head** and the **body** of a method.
The body is of course the *method-body* in the template above,
while the head consists of everything in the method definition
except the body.
We can say that the method head
is a description of the method:
its name, which arguments it expects,
and what type of value it will return.
A part of the program that wants to **call** a method,
needs to know about the head of that method,
but not about the body.

The **method body**, on the other hand,
contains the statements
that will be executed when the method is called.
The body is therefore a description of what, and how,
the method performs whatever it is that it does.

Here is a simple example of a method definition:

```pike
float average(float x1, float x2)
{
  return (x1 + x2) / 2;
}
```

The method `average` returns the average of its two arguments.
Both the return value and the two parameters are floating-point values.
Here are some valid statements that contain calls to `average`:

```pike
float x = average(19.0 + 11.0, 10.0);
average(27.13, x + 27.15);
float y = average(1.0, 2.0) + average(6.0, 7.1);
float z = average(1.0, average(2.0, 3.0));
```

When a method has finished what it has to do,
we say that it **returns**.
The program will then continue executing
immediately after the place of the method call.
If the method has produced a value,
we say that we return that value.

The `return` statement is used to send a value from a method
back to the point from where it was called:

```
return *expression*;
```

The `return` statement will also cause Pike to leave the method,
and continue execution
immediately after the point where the call to the method was made.
You can have several `return` statements in the same method.
If the method is defined to return `void`,
you can use `return` without a value to leave the method:

```pike
return;
```

If you reach the end of the body of a method,
without having returned first,
the method will return zero as return value.
