# The Comma Operator

The **comma** operator, written as a comma (`,`) takes
two operands. It evaluates its left operand and discards the value. It
then evaluates its right operand, and returns that value as the result
of the expression.

```pike
7 + 3, 6 * 2 // Gives 12
3,14         // Gives 14 (and not pi)
```

The comma operator is seldom necessary, except in function-like
preprocessor macros, which we advise against anyway.

The commas used to separate the arguments in a call to a method, or
the elements in an array, are not comma operators.
