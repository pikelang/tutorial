# Object, Program and Function

These three data types will be described in more detail later,
but here is a short explanation of what they are good for.

An `object` is an object,
in the object-oriented sense:
the values of a bunch of member variables as defined by a **program**
(or **class**, as a C++, Java or Smalltalk programmer would say).
We say that the object is an instance of the program.

An object is an instance of a program,
and just as we want to store objects in variables,
and send them back and forth to functions,
we sometimes want to do the same with the **programs**.
For example, we may need a function that creates an instance
(that is, `object`) of any program,
and we must therefore be able to send the program
as an argument to the function.
This is what we use the data type `program` for.

It may come as a surprise
that there is a special datatype for Pike programs,
but it is actually very useful,
and adds a lot of flexibility to Pike.

Something else that may surprise you
is that there is a data type for **methods**.
Sometimes you want to refer to "any method".
Take for example the built-in method `map`,
which is used to apply an operation to all the elements in an array.
You call `map` with (at least) two arguments:
the array to go through,
and the method to call for each element:

```pike
void write_one(int x)
{
  write("Number: " + x + "\n");
}

int main()
{
  array(int) all_of_them = ({ 1, 5, -1, 17, 17 });
  map(all_of_them, write_one);
  return 0;
}
```

Running this code snippet would output:

```
Number: 1
Number: 5
Number: -1
Number: 17
Number: 17
```
