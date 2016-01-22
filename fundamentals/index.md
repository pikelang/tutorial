# Fundamental Concepts

This tutorial assumes
that you are familiar with some fundamental concepts
that are used in all programming environments.
Look through the list,
and if you don't immediately know what one of the terms means,
you should read the explanation.

## Program

A program consists of a set of instructions
that tells the computer how to do something,
plus some data that the program can work with.
Programs can be organized in different ways,
and are often divided into several smaller parts.

## Data

The things that your program works with,
such as integers (for example **5** and **-3**)
and character strings (such as "hello" and "Hi there, John!")
are data.

## Value

One piece of data (for example the integer **5**)
is sometimes called a **value**,
and sometimes a **data item** or **data object**.
(But the word **object** also has a more specialized meaning
in connection with object-oriented programming.
More about that later.)

## Variable

A variable is a sort of box that can be used to store a value.
The variable usually has a name and also a type.
The type determines which values you can put in the variable.

## Constant

A constant is in a way the opposite of a **variable**,
but also similar.
A constant is like a variable,
in the sense that it is a sort of box
that can be used to store a value,
and that it has a name.
But once you have defined it,
it can not be changed.
Constants are often used to give names to certain values
in order to make a program easier to understand:
`minimum_income_tax` somewhere in a program
is easier to understand than just `20000`.
Sometimes the term constant is used to include **literals** too.

## Literal

A literal is a value of some kind, written in the program.
`"Hello"` is a string literal,
`-678` is an integer literal,
and `({ 7, 8, 9 })` is an array literal.
Sometimes the term **constant** is used to include literals too.

## Identifier

An identifier is a sequence of characters
that can be used in a program as a name,
of a variable or of something else.
In Pike, an identifier must start with an alphabetical letter
or an underscore character ("_").
The rest of the characters can be alphabetical letters,
underscores, and digits.
Some valid identifiers in Pike are
`n`, `number_of_9s`, and `DoNotFeedTheMonkey`.

## Data type

Values and variables have **data types**.
The value **5** has the data type **integer**
(spelled `int` in Pike),
and **5.14** has the type real number
(which is spelled `float` in Pike).
You can only put values in a variable
if the types of the value and the variable are compatible.

## Type checking

Pike has type checking,
which means that Pike keeps track
of the data types of variables and values.
If your program tries to put one type of value
in a variable which was designed to hold another type of value,
Pike may detect this,
and tell you about the problem.

## Expression

An expression is a piece of a program that gives a value
when it is executed by the computer.
An example of an expression in Pike is `5 * x + 7`, which means
"take the value of the variable `x`,
multiply it with **5**,
and then add **7**".
The computed result of an expression also has a type,
and in this case the type is `int`.

## Statement

A statement is a command that is part of a program,
and that the computer can interpret and execute.

## Control structure

The instructions in a program must be executed in the right order,
and this order is expressed using control structures.
Examples of control structures are selection (such as the **if** statement)
and loops (such as the **while** loop).
More about those later.

## True and false

Control structures such as **if** do one thing or another,
depending on a condition.
If the condition is true, it does one thing,
and if it is false, it does another thing.
Some languages have special data values,
called "true" and "false", that are used for this.
In Pike, we use the simpler convention that
the value zero (**0**) is interpreted as false,
and everything else is interpreted as true.

## Truth value

True and false are sometimes called **truth values**.

## Block

A **block** or **compound statement**
is a statement that consists of several other statements.
In Pike, we use the curly brackets "{" and "}"
to group statements into blocks.
Some other languages use the words "begin" and "end".

## Function

Most programming languages allow you to divide your program into smaller parts.
These can be called "sub-routines", "procedures", "functions" or "methods".
A function receives some values as input,
and produces some value as output.
A simple example is a function called "plus",
which receives two integers, called "x" and "y",
and returns their sum.
In mathematical notation,
this would be written something like "plus(x, y) = x + y".
In Pike, we write "`int plus(int x, int y) { return x + y; }`".

## Method

In object-oriented programming (which is explained more below),
functions belong to a certain class,
and they work mainly with the data belonging to that class.
Such a function, which belongs to a class,
is usually called a "method".
In Pike, all the functions that you define are actually methods.
We will use the term "method" in the rest of this tutorial.

## Method call

When one part of program needs to execute another part of the program,
and that other part is a method,
we say that it "calls" that method.
In Pike, we would write "`plus(3, 5)`"
to call the method `plus` mentioned above.
The values 3 and 5 are then sent to the method,
it adds them, and the result 8 is sent back from the method.

## Argument

When we call a method we send values to it.
The values that are sent to the method are called "arguments",
or "actual arguments".
In the example with the call to `plus` above,
the arguments are `3` and `5`.

## Parameter

A method needs to have some names
that it can use to refer to the argument values
that are sent to it when it is called.
These names are called "parameters" or "formal parameters".
In the example with the method `plus` above,
the parameters are `x` and `y`.
In most programming languages, and in Pike,
the parameters work just like variables which are local in the method,
and which get the arguments as initial values.

## Local

A variable that is local in a piece of code, such as a method,
is only available to the code inside that piece.
Other methods can have their own local variables with the same name,
but they are all different variables:
different boxes to store things in.

## Returning from a method

When a method has finished what it has to do,
we say that it **returns**.
The program will then continue executing
immediately after the place of the method call.
If the method has produced a value,
we say that we **return that value**.

## Object-oriented programming

In object-oriented programming,
we do not only divide the program into subprograms
("functions" or "methods"),
but group data and methods into "classes".
This makes it easier to write programs,
since we can work with one piece (that is, class) at a time.

## Class

This is a sort of "module",
used in object-oriented programming.
Usually a class is a description of a type of thing
(such as "cat", "animal" or "Internet connection"),
and it has both data and operations:
animals have a weight and a color,
and the Internet connection can change the connecting speed
and close the connection.
In Pike, the word **program** is sometimes used to mean class.

## Object

A class is a description of a type of thing (such as "cat"),
and an object is one such thing (such as one particular cat).
Sometimes we say that an object is an **instance** or a **clone** of a class:
all cats are instances of the cat class.

## Source code

The source code is the program itself,
as written by the programmer.
The source code is usually stored in one or more text files.

## Syntax

The syntax for a programming language is the grammar for the language,
i e the rules for how the source code is written.
The syntax only describes how the language looks,
not what it actually does.

## Compilation

Compiling is the process of translating the source code
to a format that the computer can execute.
This format can be machine code,
which is directly executable by the computer.
It can also be an intermediate format,
which has to be interpreted by another program.
