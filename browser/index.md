# Your Second Pike Program

Your first Pike program,
which was examined above in this tutorial,
was a program that printed "Hello world!" on the screen.
Your second Pike program will be a World Wide Web browser,
just like Firefox, Google Chrome, Safari or Internet Explorer.

Well, perhaps not *just* like those;
those are all very large programs,
and our browser will be a very small one.
We will just make it advanced enough
to connect to a World Wide Web server,
download a web page,
and then display its markup on the screen.

We start by creating a file, for example called
`webbrowser.pike`:

```pike
// The Very Simple World Wide Web Browser

int main()
{
  write("Welcome to the Very Simple WWW Browser!\n");
  return 0;
} // main
```

This is almost the same program as the "hello world" program.
The only difference is that it prints something else,
and that we have added some **comments**.
Two "slash" characters (`//`) means
that the rest of the line is a comment.
Comments are ignored by Pike,
and are intended for humans who read your program.

Pike has another type of comments,
which start with `/*` and end with `*/`.
Such comments can span several lines:

```pike
/*
This is also a comment.
For example, you can "comment out" parts
of your program with this type of comment,
so Pike doesn't run those parts.
*/
```

## Variables

The web browser must be told
which web page it should download and display.
As you may know,
the "addresses" to web pages are called URLs (Uniform Resource Locators),
and they look like `pike.lysator.liu.se` or `http://pike.lysator.liu.se/`
(where the second form is correct, but the first one usually works too).

We add some code that lets the user type a URL,
stores that URL in a variable,
and also prints it on the screen as confirmation.
The new additions are commented with numbers,
described further below:

```pike
// The Very Simple World Wide Web Browser

int main()
{
  write("Welcome to the Very Simple WWW Browser!\n");
  string url; // 1
  write("Type the address of the web page:\n");
  url = Stdio.stdin->gets(); // 2
  write("URL: " + url + "\n"); // 3
  return 0;
} // main
```

There are four new things here:

1. We create a **variable** with the name `url`.
   This is called to **declare** a variable.
   The variable has the type `string`,
   which means that we can use it to store strings in.
   A string is a sequence of characters.

2. `Stdio.stdin->gets()` is used to let the user
   type some text on the keyboard.
   When the user hits the return key,
   the text is returned as a string.
   (`Stdio.stdin->gets()` calls the method `gets`
   in the object `stdin` from the module `Stdio`,
   but you don't need to worry about that just yet.)

   We take that string, and store it in the variable.
   This is called **assignment**,
   or to **assign** a value to the variable.

3. In the last line with `write`,
   we add three strings together:
   `"URL: " + url + "\n"`

When we run the program, it may look something like this.
The user's commands and input are shown after the `>` prompts:

```hilfe
> pike webbrowser.pike
Welcome to the Very Simple WWW Browser!
Type the address of the web page:
> http://pike.lysator.liu.se/
URL: http://pike.lysator.liu.se/
```
