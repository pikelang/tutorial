# Arithmetical Operations

Pike can do all the usual arithmetic operations: addition (which is
expressed with the operator `+`), subtraction (`-`),
division (`/`), multiplication (`*`), and also modulo
(`%`). The modulo operation, sometimes called "remainder" or
"rest", gives the remainder from a division. For example, if you
divide 7 by 3, 3 goes in 7 two times. But there is a remainder of 1,
and that is the result of the modulo operation.

Here is a table of the arithmetic operations:

| Operation | Syntax | Result |
| --- | --- | --- |
| Addition | `a + b` | the sum of a and b |
| Subtraction | `a - b` | b subtracted from a |
| Negation | `- a` | minus a |
| Multiplication | `a * b` | a multiplied by b |
| Division | `a / b` | a divided by b |
| Modulo | `a % b` | the remainder of a division between a and b |

Remember that pike makes a difference between numerical values that
are integers (the type `int`), and numerical values that are
real or "floating-point" numbers (the type `float`). This has
some importance for how expressions with arithmetic operations are
calculated by Pike. If at least one of the operands is a
`float`, we use the floating-point versions of the operation.
In if both operands are integers, we use a special integer-only
version of the operation. For most of the operations, the only
difference is that the type of the result will be different: `2 +
2` will give the integer value **4**, while `2 + 2.0`
will give the floating-point value **4.0**. But with division is
more important.

With **floating-point division**, such as in `9.0 / 4.0`,
the result is a floating-point value, in this case **2.25**. But
with **integer division**, such as in `9 / 4`, the result is
only the integer part, in this case **2**.

The fact that integer division only gives the integer part can be
treacherous: If 73 out of 92 people payed their income tax on time,
don't try to calculate the percentage with the expression `73 / 92
* 100`. That would give the result **0**.

It is very common in programs to increment or decrement a variable
with one, such as in the statements

```pike
i = i + 1;
p = p - 1;
```

To simplify such programs, Pike has these extra operators, which
you can use if you want to:

| Operation | Syntax | Result |
| --- | --- | --- |
| Increment | `++ a` | increments a and returns the new value for a |
| Decrement | `-- a` | decrements a and returns the new value for a |
| Post increment | `a ++` | increments a and returns the old value for a |
| Post decrement | `a --` | decrements a and returns the old value for a |

The two versions of increment, `++i` and `i++`, both
increment the value in the variable `i` with 1. The difference
is if we want to use them as parts of a larger expression. In that
case, `++i` gives the new, incremented, contents of `i`
as value, while `i++` gives the old contents of `i` as
value. The same difference applies to `--i` and
`i--`.
