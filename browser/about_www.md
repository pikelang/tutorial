# Some Notes About WWW

* When our simple web browser prints a web page,
  it just prints the raw HTML code.
  All the things between `<` and `>`
  characters are called *tags*,
  and they contain commands
  that indicate how the rest of the text should be formatted.
  To do that well is beyond the scope of this tutorial.

* Some web addresses don't refer to HTML pages,
  but to (among other things) sound clips or pictures.
  If you try to access such a web address with this browser,
  it will dump the sound or picture on the screen
  as if it had been text,
  and this will look even uglier than raw HTML code.
  Real web browsers check the type of the web page,
  and then take the appropriate action depending on that type.

* If your web browser fails to retrieve a web page
  that you think exists,
  this may be because you haven't typed the address exactly correct.
  For example,
  some addresses must have a slash (`/`) at the end.
  More advanced web browsers discuss things like this with the web server,
  and they usually manage to fix the address for you.

* You may not get a "failed" message
  when you try to retrieve a web page that doesn't exist.
  When the web server gets a request for a non-existent page,
  it generates a new web page with an error message,
  and your web browser receives and shows that page.
