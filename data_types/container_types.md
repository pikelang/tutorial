# Container Types

Some of the data types are **containers**.
A data item of one of these container types
can contain other data items.

The simplest of the container types is the **array**.
If a variable is a box where you can put a data item,
an array is a whole sequence of such boxes.
The boxes are numbered, starting with 0,
so in an array with 10 places the first one has number 0,
and the tenth and last one has number 9.
The position numbers are called **indices**.
(One **index**, many indices.)

You can give an array in your Pike program
by listing its elements inside parenthesis-curly-bracket quotes:

```pike
({ "geegle", "boogle", "fnordle blordle" })
({ 12, 17, -3, 8 })
({  })
({ 12, 17, 17, "foo", ({ "gleep", "gleep" }) })
```

As you can see,
an array can be empty (containing no elements),
and it can also contain other arrays.
An array can contain elements of different types,
but it is more common with
arrays that only contain one type of element.

You can define array variables like this:

```pike
array a;		// Array of anything
array(string) b;	// Array of strings
array(array(string)) c;	// Array of arrays of strings
array(mixed) d;		// Array of anything
```

Then you can give values to these variables:

```pike
a = ({ 17, "hello", 3.6 });
b = ({ "foo", "bar", "fum" });
c = ({ ({ "John", "Sherlock" }), ({ "Holmes" }) });
d = c;
```

You can access the elements in an array,
either to just get the value or to replace it.
This is usually called **indexing** the array.
Indexing is done by writing the position number, or index,
within square brackets after the array:

```pike
write(a[0]);    // Writes 17
b[1] = "bloo";  // Replaces "bar" with "bloo"
c[1][0] = b[2]; // Replaces "Holmes" with "fum"
```

There are many useful operations that can be done with arrays.
For example, you can add two arrays together:

```pike
({ 7, 1 }) + ({ 3, 1, 6 })
```

The result of that expression is a new array,
with the elements from the two arrays concatenated:

```pike
({ 7, 1, 3, 1, 6 })
```

Except for arrays there are two other container types in Pike,
`mapping` and `multiset`.
A set is something where a value is either a member or not,
and a multiset is a set which can contain several copies of the same value.
Mappings are sometimes called dictionaries,
and lets you translate from one value (such as `"beer"`)
to another value (`"cerveza"`).
Academics might know the datatype by the name "associative array",
perl programmers call them "hashes", javascript programmers say "Objects".
Mappings and multisets are explained in a later chapter.
