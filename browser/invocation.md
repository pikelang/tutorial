# Running the Program

An appropriate next step would be making your program run
without the need for manually invoking it with the pike parser.
If you are using a Unix system,
such as Linux, Solaris or OS X,
you can make the web browser a free-standing program
by adding:

```pike
#! /usr/local/bin/pike
```

(or "`#! `" followed by
whatever Pike itself happens to be called on your system)
as the very first line in the file,
without any spaces in the part pointing out the path to your pike binary.

Assuming you want your script to run
with whatever "pike" binary would be run
if "pike" was entered at the prompt, that is,
the first "pike" executable found in the user's path,
a useful and portable alternative is this syntax:

```pike
#! /usr/bin/env pike
```

Either way,
you must finish off the work
by making the file executable:

```
> chmod a+x webbrowser.pike
```

Now, you can run the web browser just by giving the command:

```
> ./webbrowser.pike
```

or by clicking on its icon in a graphic file manager.
(If you don't like the extension `.pike`,
you can simply change the name of the file to `webbrowser`,
without the extension.)

Under Windows,
you can associate the file extension `pike` with the Pike program.
Then you can start the web browser
by clicking on the web browser's icon,
or by giving the command `webbrowser.pike`
in the Command Prompt Window.
