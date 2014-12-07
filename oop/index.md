# Object-Oriented Programming

After half a century or so of computer programming,
we have learned that
**modularization** is a cornerstone of software development.
Modularization, in this context,
means that we divide a big problem into several smaller problems.
Then we write a number of programs or program parts,
each of them solving one of those small problems.

It is usually easier to jump one foot high ten times,
than it is to jump ten feet high in one jump.
In the same way,
it is usually easier to write ten small programs,
and then integrate them to a complete system,
than it is to write the entire system at once.
(Ok, we may expect some objections against that analogy.
But the idea is the same in both cases,
and it works in practice:
small programs are almost always easier to write than big ones.)

The small programs or program parts are usually called "modules".
Here, the term "module" is used in this general sense,
but you should make a mental note that in Pike,
the term **module** usually refers to a very specific kind of module,
the plug-in modules of Pike.

For modularization to work well,
we need something that is called
**information hiding** or **encapsulation**.
This means that we hide the internal structure of each module,
so the rest of the system doesn't need to worry about it.
Think of it this way:

If we build a locomotive in modules,
we want to build one module at a time,
and then bolt them together.
If the cogwheels and stuff inside those modules are sticking out,
outside the modules,
the cogwheels in one module will jam the cogwheels in another module.
The result is that the modularization doesn't work:
even if we have divided the locomotive into modules,
we still have to think about the cogwheels in all the other modules
when we design the cogwheels in this module.

It is the same way with programs.
The modules have lots of stuff inside:
variables, loops, data structures.
All of that should be hidden inside the module.
Some programmers believe they should be so well hidden
that it is impossible to look at them.
Others feel that it is enough that you don't *have* to look at them.
Remember: the cogwheels shouldn't be sticking out.

Obviously, we can't hide *all* the information.
The modules must interact in some way,
for example by sending data to each other.
The (few) things that are visible on the surface of a module,
for others to see and use,
is sometimes called its **interface**.

So how do we modularize a program?
Which parts should we divide it into?
One way is to look at what it does.
You divide the thing it does into small things,
and you divide those small things into even smaller things.

An even better way is to look at the *data*
that the program works with:
simple things like integers and strings,
and more complex things that often reflect real-world objects:
persons, aircraft, courses at a university.
Each such thing,
like that person over there,
is called an **object**,
and each *type* of thing,
like "person", is called a **class**.
As you may have guessed,
this is the basis of **object-oriented programming**.

The class describes the things,
and not only what we know about them,
but also what we can do with them.
For example, a person may have a name and a birthdate,
but a person can also eat, sleep and talk.

Sometimes we say that
an object is an **instance** or a **clone** of a class:
all persons are instances, or clones,
of the class "person".

But to use object-oriented programming to its fullest,
we need two more mechanisms: **inheritance** and **polymorphism**.
Thanks to those,
you can easily add features to an existing module.
You can re-use all the work that was put into writing that module,
and just add your new features.

If you need a class that describes birds,
and you already have a class called "animal" that describes animals,
you can create a new class that **inherits** from the "animal" class.
By inheriting,
a bird has all the attributes of an animal,
and can do everything an animal can do.
Then you just add whatever is specific to birds,
such as flying.
(Except that penguins don't fly, and bats do.
We ignore that for now.)

**Polymorphism** means that whatever we can do with an animal,
we can also do with a bird.
If we already have some program code that counts animals or sorts them,
we can use the same program code to count or sort birds,
without changing anything.
So not only can we re-use the work that was put into the "animal" class:
we can also re-use the work
that was put into much of the rest of the program.
