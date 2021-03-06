# How to Create a Class

To create a class,
you write a **class definition**,
with all the member variables and methods.
For the class `animal`,
which we have used above,
the class definition may look like this:

```pike
class animal
{
  string name;
  float weight;

  void create(string n, float w)
  {
    name = n;
    weight = w;
  }

  void eat(string food)
  {
    write(name + " eats some " + food + ".\n");
    weight += 0.5;
  }
}
```

Some explanations about this:

* A member variable,
  such as `name`,
  exists once in each cloned object,
  not in the class itself.

* When a method,
  such as `eat`,
  refers to a member variable,
  such as `weight`,
  it will use that variable
  in the same object that it was called for.
  For example,
  when we call `my_dog->eat("quiche")`,
  it is the `weight`
  in the object `my_dog`
  that is increased.

* The method `create` is special.
  This method that handles the arguments
  that you give when you clone an object.
  (C++ programmers would call this a "constructor".)

* You can also have a method called `destroy`.
  This method is what C++ programmers would call the "destructor",
  i e a method that is run just before the object disappears.
  A destructor is sometimes needed for cleanup,
  but much more seldom in Pike than in C++,
  since Pike has automatic garbage collection.
