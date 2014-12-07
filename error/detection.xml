# Detecting an Error

In the web browser, we detected the first two possible errors by
checking the data: the number of command-line arguments, and the
length of the web address that the user types.

In the third case, when a web page couldn't be downloaded, the
problem is detected somewhere inside the method `get_url` in
the module `Protocols.HTTP`. The problem must then be reported
to the program that called `get_url`, and this is done with the
**return value**. The method `get_url` usually returns an
object with the data from the web page, but if it fails to retrieve
the web page, it returns zero (**0**):

```pike
web_page = Protocols.HTTP.get_url(this_url);
if (web_page == 0)
{
  write(" Failed.\n");
  return;
}
```

The value **zero** is just the normal integer 0, but it is used
in many contexts to mean "no value" or "there was a problem". Many of
the built-in methods in Pike return 0 if they fail to do what they are
supposed to do. Most Pike programmers use the same convention.

To work this way, the integer 0 has to be special. It can be stored
in a variable of any type, and it can be returned from any method.
Every new variable that you define will contain the value 0, until you
give it another value.
