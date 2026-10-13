# Composing Strings with sprintf

C programmers are familiar with the functions `sprintf` and
`sscanf`, which are used to respectively create and analyze
strings according to format specifiers. Pike had its own
`sprintf` and `sscanf`, which are not entirely unlike
those in C.

If we start with `sprintf`, it builds a string according to
a string with format specifiers, and a number of arguments. For
example, if the variables `x` and `y` both contain the
floating-point number 2.0, the expression

```pike
sprintf("They are %.2f and %10.3f.", x, y);
```

would give the result

```text
"They are 2.00 and      2.000."
```

The format string consists of characters, that will be copied to
the result. The format string can also contain "percent specifiers",
which will be replaced by its arguments. For example, `%d` is
used to mark an integer.

Here is a list of some of the more common format specifiers:

| Specifier | Meaning |
| --- | --- |
| %d | An integer in normal decimal (that is, base-10) notation |
| %o | An integer in octal (base-8) notation |
| %x | An integer in lower-case hexadecimal (base-16) notation |
| %X | An integer in upper-case hexadecimal notation |
| %c | The character corresponding to a certain character code |
| %f | A floating-point number |
| %s | A string |

There is a large number of **modifiers** that you can use to
control the format of the output. You insert these modifiers between
the percent sign and the format character. Here are some examples of
the most useful ones:

| Specifier | Meaning |
| --- | --- |
| %*N*d | An integer right-justified in a field at least *N* characters wide |
| %-*N*d | An integer left-justified in a field at least *N* characters wide |
| %.*N*f | A floating-point number printed with *N* decimals |
| %*N*f | A floating-point number right-justified in a field at least *N* characters wide |
| %-*N*.*M*f | A floating-point number with *M* decimals, left-justified in a field at least *N* characters wide |
| %-*N*s | A string left-justified in a field at least *N* characters wide |
| %*.M*s | A string, but at most *M* characters of that string are printed |

C programmers should note that a difference from the
`sprintf` you have in C is that Pike's `sprintf` returns
the string as the value of the call.
