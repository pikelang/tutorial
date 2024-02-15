# Magic Web Stuff

Now it's time to start surfing the web!
Perhaps you know that web pages are written
in something called HTML (HyperText Markup Language),
and that the `http` you see in web addresses
like `http://pike.ida.liu.se/`
means HyperText Transfer Protocol.
The HyperText Transfer Protocol is a description
of how web browsers communicate with web servers.

It is actually a fairly complicated operation
to connect to a web server,
to tell it to send you a web page,
and then to receive that page as the server sends it.
Fortunately for us,
someone has already done this for us.
There is a **module** called `Protocols.HTTP`,
which handles the communication with the web server.
A module is a package of Pike code
that can easily be used by other programmers.

We rewrite the method `handle_url`
to actually try to fetch the web page,
using the module `Protocols.HTTP`:

```pike
void handle_url(string this_url)
{
  write("Fetching URL '" + this_url + "'...");
  Protocols.HTTP.Query web_page;
  web_page = Protocols.HTTP.get_url(this_url);
  if (web_page == 0)
  {
    write(" Failed!\n");
    return;
  }
  write(" Done.\n");
} // handle_url
```

The interesting part here is the lines

```pike
  Protocols.HTTP.Query web_page;
  web_page = Protocols.HTTP.get_url(this_url);
```

First we define the variable `web_page`,
with the data type `Protocols.HTTP.Query`.
Actually, the data type is called `Query`,
and is defined in the module `Protocols.HTTP`,
but we must write it as `Protocols.HTTP.Query`
so Pike knows where to find it.

A data item of the type `Protocols.HTTP.Query`
contains the result of a web page retrieval:
the text of the web page,
but also some more information,
such as the time when the page was created.

The actual work is done by the method `Protocols.HTTP.get_url`,
which is actually the method `get_url` in the module `Protocols.HTTP`.
It talks to the web server,
fills a `Query` object with everything it finds,
and returns it.
If it cannot find the web page, it returns zero (**0**) instead.

Some other things that might need to be explained in this example:

* We can use single quotes (') inside a string.
  If we want to put a double quote (") in a string,
  we can do so by prefixing the double quote with a backslash:

  ```pike
  "This string contains a \"."
  ```

* If the web page couldn't be found,
  we use the statement

  ```pike
  return;
  ```

  to stop executing the method `handle_url`,
  and instead return to where it was called.
  This is the same as the

  ```pike
  return 0;
  ```

  we have seen in `main`,
  except that `handle_url` doesn't return a value.

* `return` just returns from the method we are in.
  If we want to terminate the program,
  we can use the built-in function `exit`:

  ```pike
  exit(0);
  ```

  This has the same effect as returning **0** from `main`.

When we run this version of the web browser, it may look something
like this. The user's command is shown in *italics*:

```
> webbrowser.pike pike.ida.liu.se
Welcome to the Very Simple WWW Browser!
Fetching URL 'pike.lysator.liu.se'... Done.
```

If we try to retrieve a web page that doesn't exist,
the web browser fails:

```
> webbrowser.pike cod.lysator.liu.se
Welcome to the Very Simple WWW Browser!
Fetching URL 'cod.ida.liu.se'... Failed!
```
