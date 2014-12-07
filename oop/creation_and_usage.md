# Creating and Using Objects

Assuming that we have the class `animal`,
we can define some variables
that can be used to store animals.
Remember that the class is also a **data type**.
We can also create some animals
to put in those variables.
To create an animal,
we use the syntax `*classname*()`,
i e the name of the class
followed by a pair of parentheses.

```pike
animal some_animal;
some_animal = animal();
animal my_dog = animal();
```

To access a member variable in an object,
we use the syntax `*object-expression*->*variable-name*`,
i e the object followed by the operator `->`
followed by the name of the variable.

```pike
my_dog->name = "Fido";
my_dog->weight = 10.0;
some_animal->name = "Glorbie";
write("My dog is called " + my_dog->name + ".\n");
write("Its weight is " + my_dog->weight + ".\n");
write("That animal is called " + some_animal->name + ".\n");
```

Most objects need some initial values for its member variables.
For example,
every animal needs a name and a weight.
One way to handle this
is to set those variables separately,
as we have done above.
A better way is to design the class
in a way that lets it set the variables
immediately when an object is cloned from the class.
You can then give the values when cloning:

```pike
animal piglet = animal("Piglet", 6.3);
```

We can call a method in an object,
with a similar "`->`" syntax:

```pike
my_dog->eat("quiche"); // Real dogs eat quiche.
write("Its weight is now " + my_dog->weight + ".\n");
```
