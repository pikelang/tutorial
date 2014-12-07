# Showing the Page

A web browser that just prints "Done" instead of the web page
isn't of much use,
so we add some lines at the end of the method `handle_url`
to print the contents of the web page:

```pike
void handle_url(string this_url)
{
  write("Fetching URL '" + this_url + "'...");
  Query web_page = get_url(this_url);
  if (web_page == 0)
  {
    write(" Failed.\n");
    return;
  }
  write(" Done.\n");
  write("This is the contents of '" + this_url + "':\n\n");
  string page_contents = web_page->data();
  write(page_contents + "\n");
} // handle_url
```

The interesting part here is the expression

```pike
web_page->data()
```

where we call the method `data` in the data item `web_page`.
This method returns the contents of the web page,
i e the HTML code, as a string.
We then print that string.

## Methods in data items?

"But", you say,
"what is all this about a method in a data item?
I thought methods were pieces of code
that were parts of a program?"

Well, a method *is* a part of a program,
just as we have seen.
But just as the web browser we have written contains methods,
other programs can contain methods.
And the "data type" `Protocols.HTTP.Query`
is actually another program.
The big difference is that it doesn't have a method called `main`,
so it can't be used by itself.
It can only be used as a part of another program,
as we have done here.

Somewhere on your computer there is a file,
called something like
`/usr/local/pike/8.0.28/lib/modules/Protocols.pmod/HTTP.pmod/Query.pike`
or
`C:\Program Files\Pike\lib\pike\modules\Protocols.pmod\HTTP.pmod\Query.pike`.
This file contains the program `Query`
with all its methods and variables,
among them the method `data`.

A program like `Query`,
which can be used in other programs in the way we have seen,
is often called a **class**.
You can read more about how to use, and create,
classes in the chapter about
[**object-oriented programming**](../oop/index.md).
