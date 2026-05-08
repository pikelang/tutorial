# Access control

Do you remember about **information hiding**?
In the examples above,
everyone could access all the methods and member variables in all objects.
For example,
it is very easy to lose weight:

```pike
h->weight -= 10.0;
```

Oh?
The hamster only weighed 0.12,
and now it weighs *minus* 9.88?

We would like to control the access to the member variable `weight`,
so that other classes cannot touch it.
For uses like this,
there are a number of **access modifiers**,
which are written before the data type
in the definition of a method or member variable.
For example,
the weight of an animal
is represented by the member variable `weight`,
defined as:

```pike
float weight;
```

By changing that to

```pike
private float weight;
```

we only allow methods in the same class to access that variable.

The following access modifiers exist:

* `public`

  This is the default,
  and means that any method can access the member variable,
  or call the method.


* `private`

  This means that the member variable or method
  is only available to methods in the same class.


* `static`

  This means that this member variable or method
  is only available to methods in the same class,
  and in subclasses
  (`static` in Pike does not at all
  mean the same thing as `static` in C++:
  instead, it is similar to `protected` in C++).

* `local`

  This means that even if this method is overridden
  by a method in a subclass,
  methods in this class will still use this method.


* `final`

  This prevents subclasses from re-defining this method.

If a class has a constructor
(that is, a method called `create`)
it can be a good idea to declare it `static`.
It is not supposed to be called
except during the construction of the object,
and if it is not `static`
there may be some type incompatibilities
in connection with inheritance.
