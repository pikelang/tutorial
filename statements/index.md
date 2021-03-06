# Statements

## Choosing between Alternatives

A program must sometimes make choices,
choosing between different instructions to execute.
Sometimes it must also execute
the same instructions several times.
All this is done using various **control structures**.
We will start by looking at
the different ways of choosing between alternatives.

Pike has three facilities for choosing between alternatives:
the **if** statement,
the **switch** statement,
and the `? :` operator.

## The `if` statement

The `if` statement comes in two flavors.
The first and simplest one follows this pattern or template:

```pike
if ( *expression* )
  *statement*
```

As usual in this tutorial,
words in a `fixed-width font`
are supposed to be written verbatim in the program,
while words in *italics*
are supposed to be replaced by something else.
This means that the word `if` and the parentheses should be kept,
but you replace *expression* with some expression,
and *statement* with some statement.
An example,
which could have been part of a control program for a stove,
looks like this:

```pike
if (temperature < 200.0)
  burn();
```

When Pike encounters an `if` statement,
it first calculates the value of the *expression*.
Pike then checks if this value is **true** or **false**.
The value zero (**0**) is considered to be **false**,
and everything else is **true**.
If the value is **true**,
the *statement* is executed.
If the value is **false**,
nothing is done,
and program execution will continue after the `if` statement.

An `if` statement can also follow this template:

```pike
if ( *expression* )
  *statement1*
else
  *statement2*
```

Example:

```pike
if (this_user == file_owner)
  allow_access();
else
  deny_access();
```

A statement can be a block,
which is several statements enclosed by curly brackets.
Example:

```pike
if (this_user == file_owner)
  allow_access();
else
{
  deny_access();
  send_message(file_owner, "Warning: " + this_user +
               " tried to access your file.");
}
```

You can "chain" several `if` statements together, like this:

```pike
if (temperature < 200.0)
  burn(10);
else if (temperature < 300.0)
  burn(5);
else if (temperature < 400.0)
  burn(2);
else
  turn_off_heat();
```

## The `switch` statement

If your program is choosing
between a number of different actions,
depending on the value of a variable or expression,
you can express this using a chain of `if` statements:

```pike
if (command == "print")
  print(argument);
else if (command == "save")
  save(argument);
else if (command == "quit" || command == "exit")
  quit(argument);
else
  write("Unknown command.\n");
```

In such cases a `switch` statement can be a better alternative:

```pike
switch(command)
{
  case "print":
    print(argument);
    break;
  case "save":
    save(argument);
    break;
  case "quit":
  case "exit":
    quit(argument);
    break;
  default:
    write("Unknown command.\n");
    break;
}
```

In a `switch` statement,
Pike first calculates the value of the expression between the parentheses,
in this case `command`.
It then compares this value with
all the values given in the `case`s in the body
(i e between the curly brackets)
of the `switch` statement.
If it finds a value that is equal,
it jumps to that place
and continues to execute the program there.
If it comes to a `break` statement,
it will skip the rest of the code in the `switch` body,
and continue execution after the block.

It is not necessary to have a `default:` block,
but if one exists,
Pike will go to that one if it finds no matching `case` value.
The final `break` statement in this example isn't really necessary,
since the switch statement block ends there anyway,
but it won't hurt either.

You can use a range of values in a case:

```pike
case 10..14:
```

This case will match if the value is between 10 and 14,
inclusively: 10, 11, 12, 13 or 14.

## The ugly `? :` operator

The operator `? :` is similar to the `if` statement,
but returns a value.
Expressions that use the operator `? :` follow this template:

```pike
*condition* ? *then-expression* : *else-expression*
```

*Condition*, *then-expression* and *else-expression*
are three expressions.
Pike starts by calculating the value of *condition*.
If that value is **true**,
it then calculates *then-expression*,
and doesn't do anything with *else-expression*.
If the value of *condition* is **false**,
it calculates *else-expression*,
and doesn't do anything with *then-expression*.
The value of the whole construct
is the value of the expression that was calculated:
either *then-expression* or *else-expression*.

Using this operator,
you can rewrite

```pike
if (a > b)
  max_value = a;
else
  max_value = b;
```

as

```pike
max_value = (a > b) ? a : b;
```

We recommend that you don't use the `? :` operator,
unless you have to.
It can be necessary when writing function-like macros,
but that is beyond the scope of this tutorial.
