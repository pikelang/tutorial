# Command-line Arguments and if

Before we let the program actually do anything
with the URL we give to it,
we will improve the program
to let it take the URL as a **command-line argument**.
That is, we want to start the program with the command

```
> webbrowser.pike http://pike.ida.liu.se/
```

instead of letting the program ask for the URL.
We add some code for this:

```pike
#! /usr/local/bin/pike

// The Very Simple World Wide Web Browser

int main(int argc, array(string) argv) // 2)
{
  write("Welcome to the Very Simple WWW Browser!\n");
  string url;
  if (argc == 2)   // 3), 5)
    url = argv[1]; // 4)
  else             // 5)
  {                // 5)
    write("Type the address of the web page:\n");
    url = Stdio.stdin->gets();
  }                // 5)
  write("URL: " + url + "\n");
  return 0;
} // main
```

This program can handle a command-line argument,
but if you don't give one,
it will ask for an URL just as before.

There are some new things to explain here:

1. The first line `#! /usr/local/bin/pike`
   only works on a Unix system,
   as described earlier.
   You can remove it if you are using Windows.

2. We have added `int argc, array(string) argv`
   as **parameters** to `main`.
   These parameters are like normal variables,
   except that they will be assigned some values automatically
   when the program starts.

   The variable `argc` has the type `int`,
   which means **integer**.
   It will contain the number of command-line arguments.
   The program name is counted as an argument,
   so if you give one argument to the program,
   `argc` will have the value **2**.

   The variable `argv` will contain the arguments.
   Its type is `array(string)`,
   which means **array of strings**.
   Each command-line argument is put in a string,
   and together they form a list or array.

3. `argc == 2` is a comparison.
   We check if the value of `argc` is **2**.
   `==` is an **operator**
   that checks if two things are the same.
   Some other comparison operators in Pike are `<` (less than),
   `>=` (greater than or equal), and `!=` (not same).

4. `argv[1]` retrieves the element at position number 1 in an array.
   The positions are numbered from 0,
   so position 1 is actually the second element in the array.
   This is the URL given as argument to the program.
   `argv[0]` contains the name of the program,
   the string `"webbrowser.pike"`.

5. The `if` statement lets Pike choose between different actions.
   It follows the template or pattern

   ```pike
   if ( *condition* )
     *something*
   else
     *something-else*
   ```

   If the *condition* (in our case, that `argc == 2`) is **true**,
   Pike will do the *something*.
   If the *condition* is **false**,
   it will do the *something-else*.
   In our program,
   there are two **statements** in the *something-else*,
   so we must enclose it in curly brackets, `{` and `}`.
