# Operations on Sets

Some of the operators that are used for bitwise operations
(`|`, `&` and `^`) can also be used for
operations on sets, such as union and intersection. They can be
applied to multisets, but also to arrays and mappings.

| Operation | Syntax | Result |
| --- | --- | --- |
| Intersection (and) | `a & b` | All elements present in both a and b. |
| Union (or) | `a \| b` | All elements present in at least one of a and b. |
| Symmetric difference (exclusive or) | `a ^ b` | All elements present in a or b, but not present in both. |

Two calculate the difference between two multisets, arrays or
mappings, you use the `-` operator:

| Operation | Syntax | Result |
| --- | --- | --- |
| difference | `a - b` | All elements present in a, but not in b. |

When using mappings in set operations, we only consider the
indices. The values are copied along with the indices. If an index is
present in both mappings in a union or intersection, the one from the
right-side mapping will be used.

Some examples:

```pike
mapping m1 = ([ 1:"one", 2:"two" ]),
        m2 = ([ 2:"TWO", 3:"THREE" ]);
```

| Expression | Result |
| --- | --- |
| `m1 & m2` | `([ 2:"TWO" ])` |
| `m1 \| m2` | `([ 1:"one", 2:"TWO", 3:"THREE" ])` |
| `m1 + m2` | `([ 1:"one", 2:"TWO", 3:"THREE" ])` |
| `m1 ^ m2` | `([ 1:"one", 3:"THREE" ])` |
| `m1 - m2` | `([ 1:"one" ])` |

You can also use the operator `+` on multisets, arrays and
mappings. For multisets and mappings, it calculates the union, i e the
same as the `|` operator. For arrays, it gives a different
result: it just concatenates the arrays, instead of calculating the
union:

| Expression | Result |
| --- | --- |
| `({ 1, 2, 4 }) \| ({ 3, 4 })` | `({ 1, 2, 3, 4 })` |
| `({ 1, 2, 4 }) + ({ 3, 4 })` | `({ 1, 2, 4, 3, 4 })` |
