# Repetition (or "Loops")

Pike has four different facilities for repetition:
the `while` statement,
the `for` statement,
the `do while` statement,
and the `foreach` statement.

## The `while` Statement

The `while` statement does something
as long as a condition is true.
It follows this template:

```pike
while ( *expression* )
  *statement*
```

Pike calculates the value of *expression*.
If the value is **false**,
it leaves the loop.
If the value is **true**,
it executes *statement*,
and then it goes back to the start
and calculates the value of *expression* once again,
to see if we should run another iteration of the loop.

Example:

```pike
while (temperature < 200)
  heat_some_more();
```

This will keep calling the method `heat_some_more`
until the value of `temperature` is at least **200**.
If `temperature` was at least **200** from the start,
`heat_some_more` is never called.

As always,
*statement* can be a block,
so we can have several statements that are executed
in each iteration of the loop.
This example will print the first five elements
(element number 0, 1, 2, 3, and 4)
in the array `argv`,
each on its own line:

```pike
int i = 0;
while (i < 5)
{
  write(argv[i] + "\n");
  i = i + 1;
}
```

## The `for` Statement

The `for` statement does something as long as a condition is **true**,
just like the `while` statement,
but the `for` statement also has a place
to put an expression that is calculated
before the loop is started,
and another place
for an expression that is run immediately after the statement in the loop.
The `for` loop follows this template:

```pike
for ( *init-expression* ; *condition-expression* ; *change-expression* )
  *statement*
```

This is (almost exactly)
equivalent to this **while** loop:

```pike
*init-expression*;
while ( *condition-expression* )
{
  *statement*
  *change-expression*;
}
```

The **while** loop in the example above,
the one that writes the element in an array,
can be re-written as a **for** loop,
like this:

```pike
int i;
for (i = 0; i < 5; i = i + 1)
  write(argv[i] + "\n");
```

As an extra feature,
the definition of the loop variable
can be put inside the `for` loop:

```pike
for (int i = 0; i < 5; i = i + 1)
  write(argv[i] + "\n");
```

In that case,
the variable `i` is local in the `for` loop,
and disappears when we leave the loop.

## The `do while` Statement

Sometimes we don't want to do the test in a loop
until after the first iteration
of the statement in the loop.
In those case we can use a **do while** loop.
The **do while** loop statement
follows this template:

```pike
do
  *statement*
while ( *expression* );
```

Pike starts by executing *statement*.
Then it calculates the value of *expression*.
If the value is **false**,
it leaves the loop.
If the value is **true**,
it goes to the start of the loop,
executes *statement* again,
and then calculates the value of *expression* once again,
to see if we should run another iteration of the loop.

If we want the user to answer "yes" or "no" to a question,
and we want to keep asking until we get either "yes" or "no",
we could write a loop like this:

```pike
string answer;
write("Have you stopped beating your wife yet?\n");
do
{
  write("Answer yes or no: ");
  answer = Stdio.stdin->gets();
} while (answer != "yes" && answer != "no");
```

## The `foreach` Statement

The **foreach** loop statement is very useful.
It goes through all the elements in an array,
doing something with each element.
It follows this template:

```pike
foreach( *container* , *loop-variable* )
  *statement*
```

*Container* should be an expression with an array as value,
and *loop-variable* should be the name of a variable.
Pike will execute *statement*
once for each element in the array *container*,
with that element in the variable *loop-variable*.
This example will print all the strings in the array **argv**,
each on its own line:

```pike
string s;
foreach (argv, s)
  write(s + "\n");
```

The `foreach` statement is similar to the `for` statement,
in that the definition of the loop variable
can be put inside the `foreach` loop:

```pike
foreach(argv, string s)
  write(s + "\n");
```

In that case,
the variable `s` is local in the `foreach` loop,
and disappears when we leave the loop.

## `break` and `continue`

Sometimes you want to leave a loop somewhere in the middle,
and continue executing the program
after the end of the loop.
You can use the `break` statement for this,
as in this example:

```pike
while (1)
{
  string command = Stdio.stdin->gets();
  if (command == "quit")
    break;
  do_command(command);
}
```

`break` can be used in loops and in `switch` statements.
It will cause Pike to "break out" of the loop or `switch` statements,
and execution will continue after the loop or `switch` statement.

`continue`,
on the other hand,
can only be used in loops.
A `continue` statement will cause Pike
to skip the rest of the body of the loop,
going directly to the next iteration.
For example,
this loop will never call `do_command`
with an empty string as argument:

```pike
while (1)
{
  string command = Stdio.stdin->gets();
  if (strlen(command) == 0)
    continue;
  do_command(command);
}
```

Some programmers feel that `continue` is unnecessary
and makes the code hard to read.
A loop that uses `continue`
can always be re-written without `continue`.
Our example would look like this:

```pike
while (1)
{
  string command = Stdio.stdin->gets();
  if (strlen(command) != 0)
    do_command(command);
}
```

There are at least three more ways of leaving a loop in the middle:

* You can use the `return` statement to leave the entire method.

* You can use `throw` to throw an exception.

* You can call `exit` to terminate the program.
