# Operations on Complex Types

The same operators as for the arithmetical operations can also be
used on some other data types. For example, by "adding" two arrays you
can concatenate them: `({ 7, 6, 3 }) + ({ 6, 19 })` gives the
result `({ 7, 6, 3, 6, 19 })`.

Here is a complete table of what happens when you use the
arithmetic operators with values of the various types in Pike:

| Operation | Returned type | result |
| --- | --- | --- |
| `*int* + *int*` | int | the sum of the two values |
| `*float* + *int*`<br>`*int* + *float*`<br>`*float* + *float*` | float | the sum of the two values |
| `*string* + *string*`<br>`*int* + *string*`<br>`*float* + *string*`<br>`*string* + *int*`<br>`*string* + *float*` | string | In this case, any int or float is first converted to a string. Then the two strings are concatenated and the resulting string is returned. |
| `*array* + *array*` | array | The two arrays are concatenated into a new array and that new array is returned. |
| `*mapping* + *mapping*` | mapping | A mapping with all the index-value pairs from both mappings is returned. If an index is present in both mappings the index-value pair from the right mapping will be used. |
| `*multiset* + *multiset*` | multiset | A multiset with all the members from both multisets is returned. |
| `*int* - *int*` | int | The right value subtracted from the left. |
| `*float* - *int*`<br>`*int* - *float*`<br>`*float* - *float*` | float | The right value subtracted from the left. |
| `*string* - *string*` | string | A copy of the left string with all occurrences of the right string removed. |
| `*array* - *array*` | array | A copy of the right array with all elements present in the right array removed. Example: `({2,1,4,5,3,6,7}) - ({3,5,1})` will return `({2,4,6,7})`. |
| `*mapping* - *mapping*` | mapping | A new mapping with all index-value pairs from the left mapping, except those indexes that are also present in the right mapping. |
| `*multiset* - *multiset*` | multiset | A copy of the left multiset without any member present in the left multiset. |
| `- *int*` | int | Same as 0 - *int*. |
| `- *float*` | float | Same as 0 - *float*. |
| `*int* * *int*` | int | the product of the two values |
| `*float* * *int*`<br>`*int* * *float*`<br>`*float* * *float*` | float | the product of the two values |
| `*array(string)* * *string*` | string | All the strings in the array are concatenated with the string on the right in between each string. Example: `({"foo,"bar})*"-"` will return `"foo-bar".` |
| `*int* / *int*` | int | The right integer divided by the left integer rounded towards minus infinity. |
| `*float* / *int*`<br>`*int* / *float*`<br>`*float* / *float*` | float | The right value divided by the left value. |
| `*string* / *string*` | array(string) | In symmetry with the multiplication operator, the division operator can split a string into pieces. The right string will be split at every occurrence of the right string and an array containing the results will be returned. Example: `"foo-bar"/"-"` will return `({"foo","bar"})` |
| `*int* % *int*` | int | The rest of a division. If `a` and `b` are integers, `a%b` is the same as `a-(a/b)*b` |
| `*float* % *float*`<br>`*int* % *float*`<br>`*float* % *int*` | float | The rest of a division. If `a` and `b` are floats, `a%b` is the same as `a-floor(a/b)*b` |
