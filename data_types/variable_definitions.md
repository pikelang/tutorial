# Variable Definitions

## Zero is special

The value zero (**0**) is a special case.
It is not just an integer value,
but can also be used to mean "no value" for all the types,
and not just integers.
If you create a variable and don't put a value in it,
it starts with the value **0**.

Some effects of this may be surprising to C programmers:

```pike
float f;  // Now, f contains the **integer** value 0.
f = f + 1;// Now, f contains the **integer** value 1.
f = 0;    // Now, f contains the **integer** value 0 again!
f = 0.0;  // Now, f contains the **real** value 0.0.
```

It's important to note that
the integer value 0
and the real value 0.0
are not equal to one another in Pike.
It is also worth noting
 that uninitialized strings,
as all other uninitialized variables,
start at 0.
If you don't take this into account,
and write code that successively builds some form of answer,
reply or similar:

```pike
string accumulate_answer()
{
  string result;
  // Probably some code here
  result += "Hi!\n";
  // More code goes here
  return result;
}
```

you will get a string `"0Hi!\n"`,
since Pike will try to make the best of the situation,
adding your string to the integer 0.
Had you instead initialized the variable to `""`,
as in `string result = "";`,
you'd get a better result.

## How to specify data types

In general, you just use the name of the data type:

```pike
int number_of_wolves;
Protocols.HTTP.Query this_web_page;
float simple_plus(float x, float y) { return x + y; }
```

You can also use the data type `mixed`,
meaning any type of value:

```pike
mixed x;
array(mixed) build_array(mixed x) { return ({ x }); }
```

The variable `x` can contain any type of value.
The method `build_array` takes an argument of any type,
and returns it inside an array.

Pike also lets you use "or" notation for datatypes,
saying that a value is one of several possible datatypes:

```pike
int|string w;

array(int|string|float) make_array(int|string|float x)
{
  return ({ x });
}
```

The variable `w` can contain either an integer or a string.
The method `make_array` takes an integer,
a string or a floating-point number as argument,
and returns it inside an array.

If you know that a variable will contain strings or integers,
it is usually better to use `string|int` than `mixed`.
It is slightly longer to write,
but it allows Pike to do type checking
when the program is compiled and executed,
thus helping you to ensure
that your program works as it should.
