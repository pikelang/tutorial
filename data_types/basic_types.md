# Basic Types

We have already seen integers (`int`) and strings (`string`)
being used in several examples,
but the third basic type, `float`, is new.
A `float`, also called a **real number** or a **floating-point number**,
is different from an integer in that it can have a fraction part:

```pike
6.783   // This is a floating-point number
17      // This is an integer
17.0    // This is a floating-point number
```

Note that Pike differentiates
between integer and floating-point numbers
that happen to be equal to an integer.
If you write `17` in a Pike program you get an integer,
and if you write `17.0` you get a floating-point number.
Inside the computer they look completely different.

You can define variables like this:

```pike
int number_of_monkeys;  // An integer variable
float z = -16.2;        // A floating-point variable
string file_name;       // A string variable
mixed x;                // A variable for anything
```

The data type `mixed` means "any type of value".
