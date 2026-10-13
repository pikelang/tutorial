# Modules

# Some Examples of Modules

A module is a sort of "plug-in": a software package that can easily
be used by other programmers. Modules can contain methods, classes,
constants, and also other modules. We will use the term **members**
for something, such as a method, that a module contains. Some modules
are written in Pike, but C and C++ can also be used.

Pike is delivered with a number of useful modules.
Here is a list of a few of the more interesting modules.

* **Stdio**

  This module is used for reading and writing files, and also for
  communication over the Internet, and for text-based dialogues with the
  user. We have used the **Stdio** module in several examples in this
  tutorial.

* **GTK**

  A toolkit for creating graphical user interfaces, with windows,
  buttons and so on.

* **Image**

  Processing and manipulation of pictures.

* **Protocols**

  Various protocols, i e ways of communicating. One of these is
  `Protocols.HTTP`, which is used to communicate with World Wide
  Web servers in order to retrieve web pages. Some other supported
  protocols are **DNS**, **IMAP**, **IRC**, **LDAP**,
  **LysKOM**, **NNTP**, **SMTP**, and **TELNET**.

* **MIME**

  Support for coding and encoding using MIME, which is used in
  electronic mail.

* **Crypto**

  Support for cryptography.

* **Calendar**

  Support for various calendar and date formats.

* **Sql**

  This module lets Pike use SQL database queries, with database servers
  such as mySQL, Oracle and Sybase.

* **Thread**

  Support for threaded execution of Pike programs.

* **Process**

  Functions to start and control other processes.

* **Getopt**

  Routines to interpret and handle command line options.

* **LR**

  LALR(1) parser generator.

* **Yp**

  Network Information System support.

* **Gz**

  Support for unpacking compressed files.

* **Regexp**

  Support for matching so-called regular expressions.

Depending on which operating system you are using, and on exactly
how Pike was installed on your system, some of these modules may not
be available.
