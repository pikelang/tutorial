# How Do You Create a Module?

A module is a package of Pike code, typically a file. You can also
write modules in C or C++, but how to do that is outside the scope of
this tutorial.

The module is a file of Pike code. Lets say that we want to create
a module called `trig`, which has two members: a method
`cos2` that calculates the square of the cosine function, and
the constant `pi`.

We create a file, called `trig.pmod`, with the following
contents:

```pike
float cos2(float f)
{
  return pow(cos(f), 2.0);
}

constant PI = 3.1415926535;
```

Now that the module file exists, we can use it. If we use it from a
program that is stored in the same directory as `trig.pmod`, we
can use the `.*module-name*` notation, so the program will
look like this:

```pike
int main()
{
  write("The square of cos(pi/4) is " +
	.trig.cos2(.trig.PI/4) + ".\n");
  return 0;
}
```

Or, if we prefer to **import** the module:

```pike
import .trig; // Import the module from this directory

int main()
{
  write("The square of cos(pi/4) is " +
	cos2(PI/4) + ".\n");
  return 0;
}

```
