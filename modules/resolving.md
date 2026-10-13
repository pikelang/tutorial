# How Does Pike Find the Modules?

Here is a somewhat detailed explanation of exactly how Pike finds
the modules that you tell it to use. Normally you don't really need to
worry about all the details, except for what is needed to put your own
modules in a place where Pike can find them. But sometimes the details
can be important, for example if there are several modules with the
same name, but in different places, or if you want to do something
advanced and ingenious with modules.

Every module that is used somewhere in your program is loaded when
the program starts. It doesn't matter if you are importing the entire
module, or if you are just using a "qualified" name such as
`smorglemod.fnordle()` (that is, the method `fnordle` in
the module `smorglemod`). This is done even before
`main` is called. That the module is loaded means that the file
is read from disk, and the things in the module are made accessible to
your program.

When Pike loads a module with the name `module-name`,
Pike will look for a module with that name in the following
directories, in this order:

1. If the `module-name` was prefixed with a dot, in the
   same directory as the program that used the module

2. In directories that have been imported with `import
   "directory-name"`

3. In directories added with `add_module_path`

4. In directories specified with `-M` on the command line

5. In directories listed in the environment variable
   `PIKE_MODULE_PATH`

6. In the directory with builtin modules, for example called
   `/usr/local/pike/7.4.1/lib/modules/` or
   `C:\Program Files\Pike\lib\pike\modules`

In each of those directories, Pike will look for files or
subdirectories, in this order:

1. If there is a file called `module-name.pmod`, Pike
   will load that file as a Pike program, clone it, and use the
   newly-cloned object as a module.

2. If there is a directory called `module-name.pmod`,
   Pike will create a module that has all the modules in that directory
   as members. If there is a module called `module` (that is, with
   the file name `module.pmod`, `module.pmod.pike`, or
   `module.pmod.so`) in the directory
   `module-name.pmod`, the members from that module will be
   used instead of the modules actually present in the directory.

3. If there is a file called `module-name.pmod.pike`,
   Pike will load that file as a Pike program, clone it, and use the
   newly-cloned object as a module.

4. If there is a file called
   `module-name.so` Pike will load that file with
   `load_module`, clone it, and use the newly-cloned object as a
   module. The file should be a dynamically linkable library of compiled
   C or C++ code.

As we said before, you usually don't need to worry about these
details, except for what is needed to put your modules somewhere where
Pike can find them.
