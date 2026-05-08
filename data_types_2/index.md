# More About Data Types

## The Basic Types

These are the **basic types** in Pike:

* integer (written `int` in Pike)
* floating-point number (written `float`)
* string (written `string`)

They are basic in the sense that
data items of these data types
can't contain other data items.
When a data item of a basic type is stored in a variable,
it is the data item itself that is stored,
and not just a reference to it,
as explained earlier.

## The Data Type `int`

Integer values can be written in several ways:

* In decimal (that is, base 10) format,
  i e the normal way to write numbers,
  such as `78`.

* In octal (that is, base 8) format,
  with a leading `0`, such as `0116`
  (which is equal to `78` in decimal notation).

* In hexadecimal (that is, base 16) format,
  with a leading `0x`, such as `0x4e`
  (which is also equal to `78` in decimal notation).

* In binary (ones and zeroes) format,
  with aleading `0b`, such as `0b1001110`
  (which again is equal to `78` in decimal notation).

* As a character literal within single quotes,
  which will give the Unicode code point for that character.
  For example,
  `'N'` will give the code point for the character **N**
  (which is equal to `78`).

You can use normal arithmetic operations,
such as addition and multiplication, with integers,
but you can also consider integers
as sequences of bits and,
apply bitwise operations on them.

For example,
the integer value **247**
is stored internally
as the sequence of bits **11110111**,
and you could left-shift it three positions
with the expression `247 << 3`,
giving the bit pattern **11110111000**,
which is equal to **1976**.

Integers in Pike can be very large.
For small integers
(usually less than 2 billion or so),
Pike will use the computer's own,
hardware-supported way of representing integers.
For larger integers,
Pike will use "bignums".
These are slower,
but can be arbitrarily large.
Just like the smaller integers,
bignums are represented exactly,
without any rounding errors.

As a programmer,
you will usually not need to worry
about the difference between bignums and smaller integers.
There may however be some operations,
for example certain methods in certain C modules,
that cannot handle bignums but work with smaller integers.

Some operations that you can apply to integers:

* **Check if it is an integer**

  `intp(*something*)` returns **1**
  if the value *something* is an integer,
  otherwise **0**.
  Example:

  ```pike
  if (intp(u))
    write("The integer is " + u + ".\n");
  else
    write("It is not an integer.\n");
  ```

* **Get a random number**

  `random(*limit*)` returns a random value
  which is greater or equal to **0**
  and less than the integer *limit*.

* **Reverse the bits**

  `reverse(*integer-value*)` returns an integer
   with the bits in the *integer-value*
   in reverse order.

## The Data Type `float`

Real numbers,
which are numbers that can have a fractional part,
such as **18.34** and **-1000.03**,
are represented in the computer as **floating-point numbers**.
Floating-point numbers can be used
to represent very large numbers,
but with limited precision.
The number of significant digits is the same,
no matter the magnitude of the value.

You can write floating-point values in two ways,
as usual with decimals,
or in exponential form with an `e`:

```pike
3.1415926535
-123.0001
12.0
1e6 // 1 times 10 to the power of 6, i e one million
2.0e-6 // 2.0 times 10 to the power of -6, i e two one-millionths
-1.0e-2 // Minus one hundredth
```

Some operations that you can apply to floating-point numbers:

* **Check if it is a floating-point number**

  `floatp(*something*)` returns **1**
  if the value *something* is a floating-point number,
  otherwise **0**.

* **Round downwards**

  `floor(*float-value*)` returns the largest integer
  that is less than or equal to *float-value*,
  but as a floating-point number.
  For example,
  `floor(7.3)` gives **7.0**
  (and not the integer **7**).
  If you do want the integer value,
  you can use an explicit type conversion:
  `(int)7.3` gives you the integer **7**.

* **Round upwards**

  `ceil(*float-value*)` returns the smallest integer
  that is greater than or equal to *float-value*,
  as a floating-point number.
  For example,
  `ceil(7.3)` gives **8.0**
  (and not the integer **8**).

## The Data Type `string`

Strings are sequences of characters,
and are written within double
quotes (`"`) in Pike:

```pike
"scorch"
"Hello world!"
"Woe to you, oh Earth and Sea"
""
```

The last one is the empty string.
Special characters,
such as the double quote character,
need to be preceded by a backslash character (`\`):

* `\"` to get a double quote (`"`) in the string
* `\\` to get a backslash character (`\`)
* `\n` to get a newline character
* `\t` to get a tab character
* `\r` to get a carriage return
* `\0` to get a NUL character,
  i e the character with character code **0**

Here are some examples of strings:

```pike
"One line\nAnother line\nA third line"
"Strings are written within \" characters."
```

You can use Unicode code points
instead of the characters themselves.
If you write `\d` followed by a decimal
(that is, normal base 10) number,
it will be replaced by the character
with that Unicode code point.
The same goes for `\x` followed by a hexadecimal
(base 16) number,
and a single `\` followed by an octal
(that is, base 8) number.
The `\0` is actually an example of this.
These four strings are identical:

```pike
"Hello world"
"Hello \d119orld"
"Hello \x77orld"
"Hello \167orld"
"\d78""2OH" // "N2OH"
```

If the character following your code point number is also a number,
follow your code point with `""`,
to tell Pike that this was the end of your code point,
and the following "2" is its own character,
not another digit of the code point.

Strings in Pike are what we call "shared",
which means that if two or more strings
contain exactly the same characters,
there will still be only one copy of it in memory.

Some operations that you can apply to strings:

* **Check if it is a string**

  `stringp(*something*)` returns **1**
  if the value *something* is a string,
  otherwise **0**.

* **Concatenation**

  Strings can be concatenated with the `+` operator:

  ```pike
  string s1 = "Hello";
  string s2 = " ";
  string s3 = "world!";
  write(s1 + s2 + s3 + "\n");
  ```

* **Concatenation of string literals**

  **String literals**,
  who are strings within double quotes
  that are written in a program,
  can be concatenated by just putting them after each other:

  ```pike
  write("Hello"  " "  "world!" + "\n");
  ```

  (This is, incidentally,
  how the terminated numeric escapes above
  work under the hood.)

Pike has many powerful built-in operations
for working with strings.
Read more about those
in the chapter about string handling.
