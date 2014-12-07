# Calling a method

First of all,
Pike calculates the values of all the arguments.
In the call

```pike
average(19.0 + 11.0, 10.0);
```

the two arguments are calculated,
giving the values **30.0** and **10.0**.
Then the argument values are sent to the method.
If we look at the method head,

```pike
float average(float x1, float x2)
```

we see that it has two formal parameters.
The argument values will be put
in the two parameter variables `x1` and `x2`,
which work as local variables
but with the argument values as initial values.

Execution will then continue with the body of the method.
In this case, the body is

```pike
{
  return (x1 + x2) / 2;
}
```

The value of `(x1 + x2) / 2` will be calculated,
giving **20.0**.
This value is then returned to the point where the method was called,
and is used as the value of the method-call expression.

Note that Pike uses "call by value".
This means that Pike always calculates the value of the arguments
before calling a method,
and then it sends those values
(or, more precisely: copies of those values)
to the called method.
This means that in the example

```pike
average(1.0, average(2.0, 3.0));
```

Pike will first call `average` with the two values **2.0** and **3.0**,
and when `average` has returned the value **2.5**,
it will send the two values **1.0** and **2.5** to `average`.
This second call of `average` will return **1.75**,
and this is the value of the entire expression.
