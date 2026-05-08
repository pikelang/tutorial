# Methods and Loops

We will soon ad the web stuff,
and actually download the web page.
But the method `main` is getting a bit long now,
so perhaps it is time to divide or program
into several methods.
Instead of putting the web stuff in `main`,
we write a method called `handle_url`,
which will do all the handling of a URL.

```pike
void handle_url(string this_url)
{
  write("URL: " + this_url + "\n");
} // handle_url
```

So far, it only writes the URL on the screen,
just like we did in `main`.

Some interesting things to note:

* `main` returns an integer,
  to indicate if the program succeeded or not.
  We don't care if `handle_url` fails,
  so we set the **return type** to `void`,
  which means it returns "nothing".

* `main` had two parameters.
  `handle_url` only has one, `this_url`.
  `this_url` can contain a string.

For this method to be executed by Pike,
we must **call** it from `main`.
We replace the statement that printed the URL with:

```pike
handle_url(url);
```

This sends the value in the variable `url`,
which is a local variable in `main`,
to `handle_url`,
where it will be put in the variable `this_url`.
The thing that is sent, `url`,
is usually called an **argument**,
and the variable that receives it, `this_url`,
is usually called a **parameter**.

A problem with our program is what happens
if the user doesn't give an argument,
and then just hits the return key
when the program asks for a URL.
`Stdio.stdin->gets()` will return an empty sting,
just as it should,
but that is not a valid web address.
If we want the program to keep asking
until it gets a non-empty answer,
we can put the two ask-and-read statements inside a **loop**:

```pike
do
{
  write("Type the address of the web page:\n");
  url = Stdio.stdin->gets();
} while (sizeof(url) == 0);
```

This is a **do-while loop**,
and such a loop follows the pattern

```pike
do
  *something*
while ( *condition* );
```

The do-while loop will do the *something* at least once,
and then keep doing it as long as the *condition* is true.
First it does the *something*,
then it checks the *condition*,
and then it either leaves the loop and continues after it,
or goes back to the start of the loop and does the *something* again.
In our case,
the *condition* is that `sizeof(url) == 0`,
i e that the string `url` is empty.

Another problem with our program is
that it only checks if `argc` is 2.
If you give several arguments,
the program will ignore them.
We change the `if` test a bit,
so that it prints an error message
and then terminates the program
if we give too many arguments.
The complete program now looks like this:

```pike
#! /usr/local/bin/pike

// The Very Simple World Wide Web Browser

void handle_url(string this_url)
{
  write("URL: " + this_url + "\n");
} // handle_url

int main(int argc, array(string) argv)
{
  write("Welcome to the Very Simple WWW Browser!\n");
  string url;
  if (argc == 1)
  {
    do
    {
      write("Type the address of the web page:\n");
      url = Stdio.stdin->gets();
    } while (sizeof(url) == 0);
  }
  else if (argc == 2)
  {
    url = argv[1];
  }
  else
  {
    write("Too many arguments. Goodbye. Sorry.\n");
    return 1;
  }
  handle_url(url);
  return 0;
} // main
```

Note how we have chained two `if` statements together
with an `else if`.

Neither the curly brackets around `url = argv[1];`
nor those around the `do` loop are necessary,
since they only encircle a single statement each,
but some programmers feel
that it is to be on the safe side having them there either way,
in case they would add yet another statement later on
and forget about adding the braces.
Others feel that
if you have curly brackets around one of the possible cases
in an `if` statement,
you should have curly braces around all of them.
Uniformity makes it easier to grasp
the structure of the whole thing at a glance.

Also note how the use of **indentation**,
i e the varying amount of white space at the beginning of each line,
makes it easy to follow the "block structure" of the program.
For example, you can easily see
that the **do-while** loop is
inside the first case of the `if` statement.
