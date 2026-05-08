# What Does Pike Look Like?

Here is a small Pike program:

```pike
int main()
{
  write("Hi there! What's your name?\n");
  string name = Stdio.stdin->gets();
  write("Nice to meet you, " + name + "!\n");
  return 0;
}
```

Programmers with some experience
from programming languages such as C, C#, and Java
will not have much trouble understanding what this program does.
Pike looks a lot like those languages,
and for example uses the "curly brackets" "{" and "}"
to organize program code into blocks.
An excerpt from a Pike program usually does the same thing
that a similar-looking program fragment in C, C# and Java would do.
Exactly *how* it is done can be very different, though.

Even if you have never seen any code in C, C# or Java before,
perhaps it doesn't come as a surprise if I tell you that
the program writes `Hi there! What's your name?` on the screen,
then waits for you to type your name,
and finally tells you that it is nice to meet you?

All those backslashes (that is, "\") and semicolons (";")
can be a bit confusing at the start.
Getting comfortable with the syntax
(that is, how a program looks on the surface)
is often the most difficult part about learning Pike.
On the other hand, experience shows that
this is the syntax that most people feel is easy and productive
when they have become used to it,
and that is the reason why we keep it as it is.
