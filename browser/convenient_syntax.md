# Syntactic Sugar

## Importing a Module

If we don't want to write the module name
every time we use something from that module,
an alternative is to **import** the module.
If we import `Protocols.HTTP`,
we can use the data type `Query`,
and the method `get_url`,
without prefixing them with `Protocols.HTTP`:

```pike
import Protocols.HTTP;

void handle_url(string this_url)
{
  write("Fetching URL '" + this_url + "'...");
  Query web_page;
  web_page = get_url(this_url);
  if (web_page == 0)
  {
    write(" Failed.\n");
    return;
  }
  write(" Done.\n");
} // handle_url
```

Although you *could* import lots and lots of modules
for the ease of lazy typing,
this mostly isn't a recommended practice,
for obvious reasons of clarity and readability.
There are also some non-obvious reasons to refrain from doing imports.
If someone adds the method `write` to the module `Protocols.HTTP`,
we would call that method instead of the one that writes text to the user.
It also takes longer to start the program,
since Pike must search through all imported modules
to find the methods you use.

## Initial Values for Variables

We can give a value to a variable when we define it,
so there is no reason to write:

```pike
  Query web_page;
  web_page = get_url(this_url);
```

We change it to this:

```pike
  Query web_page = get_url(this_url);
```
