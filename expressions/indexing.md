# Indexing

The data items of some of the data types in Pike can contain other
data items. The indexing and range operators are used to retrieve
information from inside those complex data items.

| Operation | Syntax | Result |
| --- | --- | --- |
| Indexing | `a [ b ]` | The value at index or position b in a |
| Assign at index | `a [ b ] = c` | Sets the value at index or position b in a to c |
| Range | `a [ b .. c]` | Returns a slice of a, i e the elements in a starting at the index b and ending at c |
| Range | `a [ .. c]` | Returns a slice of a, starting at the beginning of a and ending at c |
| Range | `a [ b .. ]` | Returns a slice of a, from the index b to the end of a |

Note that the indices in an array start with 0, so the last index
value in an array is equal to the length of the array minus one.

You may remember the syntax for accessing methods and member
variables in an object, using the operator `->`. This is
actually a form of indexing, and the `->` operator is just a
different way of writing the indexing operator. If you turn the
*identifier* in the expression
*something*`->`*identifier* into a string by
putting double quotes around it, you can use the `[]` indexing
operators, like this:

| Operation | Syntax | Result |
| --- | --- | --- |
| Indexing | `a ->*identifier*` | Equivalent to a["*identifier*"] |
| Assign at index | `a ->*identifier* = c` | Equivalent to a["*identifier*"] = c |

You can index strings, arrays, mapping, multisets and objects. Some
of these can only be indexed with certain types of index values, as
shown in this list:

| Operation | Returns |
| --- | --- |
| `*string*[*int*]` | Returns the numerical value of a character in the string. The result is not a character or a string, but just the integer used internally to represent the character. Note that the first character has index number 0, and so on. |
| `*array*[*int*]` | Returns an element in the array |
| `*array*[*int*]=*mixed*` | Sets an element in the array to the *mixed* value. |
| `*multiset*[*mixed*]`<br>`*multiset*->*identifier*` | Returns **1** if the index (the value between the brackets) is a member in the multiset, 0 otherwise. |
| `*multiset*[*mixed*]=*mixed*`<br>`*multiset*->*identifier=*mixed**` | If the rightmost *mixed* value is **true**, the index value is added as a member to the multiset. Otherwise it is removed from the multiset. |
| `*mapping*[*mixed*]`<br>`*mapping*->*identifier*` | Returns the value associated with the index, or 0 if it is not found. |
| `*mapping*[*mixed*]=*mixed*`<br>`*mapping*->*identifier*=*mixed*` | Associate the second *mixed* value with the first *mixed* value. |
| `*object*[*string*]`<br>`*object*->*identifier*`<br>`` | Returns the value of the variable that is named by the identifier in the object. |
| `*object*[*string*]=*mixed*`<br>`*object*->*identifier*=*mixed*`<br>`` | Set the given identifier in the object to the *mixed* value. Only works if the identifier references a variable in the object. |
| `*string*[*int*..*int*]` | Returns a piece of the string. |
| `*array*[*int*..*int*]` | Returns a slice of the array. |

When indexing an array or string, it is sometimes convenient to
start counting from the end instead of from the beginning. You can do
this with negative indices. The last element in the array can be
accessed with index -1, the second-to-last element with index -2, and
so on. In general, `arr[-i]` is equivalent to
`arr[sizeof(arr)-i]`.

Negative indices do not work with the range operator. The range
operator will try to convert negative or too-large index values to
something legal.
