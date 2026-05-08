# Inheritance

A class may **inherit** another class.
This means that the inheriting class
(also called **subclass** or **derived class**)
starts with all the methods and member variables that the inherited class,
(also called **superclass** or **base class**) has.
The subclass can then have its own,
additional methods and member variables.

One situation when inheritance can be useful
is when you want to create two or more classes
that have a common part.
Birds and fishes,
for example,
are different,
with different characteristics,
but they do have much in common.
You can make use of this by creating a class,
for example called "animal",
with the common properties.
Then you define the two subclasses "bird" and "fish",
which inherit from "animal".

At other times you already have a class
that almost does what you want it to,
but you would like to add something to it.
For example,
a class "connection",
which models an Internet connection,
may have everything you need
except for a time limit
on how long you can be connected.
You could then create a new class,
"restricted_connection",
which inherits from the old connection class,
but with the time limit added.

In both of these situations,
we have what is sometimes called an **is-a relationship**:
a bird **is an** animal,
a restricted_connection **is a** connection.
We recommend that you use inheritance in this way:
to model is-a relationships.

You use the keyword `inherit`
to let a class inherit from another class.
For example,
to create the sub-classes `bird` and `fish`,
which both inherit from `animal`,
you would write:

```pike
class bird
{
  inherit animal;
  float max_altitude;

  void fly()
  {
    write(name + " flies.\n");
  }

  void eat(string food)
  {
    write(name + " flutters its wings.\n");
    ::eat(food);
  }
}

class fish
{
  inherit animal;
  float max_depth;

  void swim()
  {
    write(name + " swims.\n");
  }
}
```

A `bird` like Tweety can do anything an animal can do,
and it has all the data that an animal has.
But it can also fly (the method `fly`),
and it has a maximum altitude
(the member variable `max_altitude`).

Note that the class `bird` has its own method called `eat`.
There was one in `animal` too,
but the new one **overrides** the old one,
and will be used in all `bird` objects.
If you have a method in the subclass
with the same name as a method in the superclass,
the module in the subclass **hides** or **overrides**
the method in the in superclass.

If you still want to call the method in the superclass,
you can prefix the name with two colons (`::`).
That is what is done in the `eat` method:
after fluttering its wings at the sight of the food,
the bird will do the actual eating,
and that is done with a call to `::eat`.

You can now use our two new classes:

```pike
bird tweety = bird("Tweety", 0.13);
tweety->eat("corn");
tweety->fly();
tweety->max_altitude = 180.0;

fish b = fish("Bubbles", 1.13);
b->eat("fish food");
b->swim();

animal w = fish("Willy", 4000.0);
w->eat("tourists");
w->swim();
```

One thing that needs explaining is the last line in the example above:

```pike
w->swim();
```

The variable `w` is of type `animal`,
and that class has no method called `swim`.
But that doesn't matter,
since Pike always looks at the **object**
that is stored in the variable.
In this case,
Pike looks at the contents of the variable `w`,
finds that it is a `fish`,
and then calls the method `swim` in that object.
Looking at the actual object like this
is called **dynamic binding**.
(The opposite,
to just look at the type of the variable
and ignore what's actually in it,
would be called **static binding**.)

As we said,
we used inheritance to express **is-a relationships**.
But there are other ways of using inheritance,
for example to simply get access to some functionality.
If you write a program that needs to work with
a file on your hard disk,
we could inherit the file-handling class `Stdio.File`,
and then use all the methods in that class
as if you had written them in your own program:

```pike
inherit Stdio.File;
// ...
read();
```

This works,
but we recommend that you create an object
of the type `Stdio.File` instead,
and call the methods for that object:

```pike
Stdio.File the_file;
// ...
the_file->read();
```
