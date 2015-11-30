# Designing an Object's Interface

## Summary
Objects have internal data or state, which we refer to as the object's attributes (e.g., an age, a name, etc.).  And, we can create accessor methods that allow an object to share the values of its attributes or that allow an object to have its attributes overwritten (see [challenge][accessor challenge]).  How do we know if we should make an object's attributes readable, writable, or both?

A central component of good object-oriented design is understanding how much of an object to *expose*.  Exposing an object means making its attributes *public*—in other words, making the object's internal data available to other objects in our program.

As a general rule, we should only expose an object as much as is necessary for our application to function.  If our application can function without exposing an attribute, don't create the reader and writer methods.  In other words, we only write code that we need.  To explore this principle, let's build a `BankAccount` class that stores information about a bank account and selectively reveals some of it.


### Public and Private Interfaces
```ruby
aisha = Person.new(name: "Aisha", email: "aisha@domain.com")
# => #<Person:0x000001011f5638 @name="Aisha", @email="aisha@domain.com">
aisha.name
# => "Aisha"

"some string".reverse
# => "gnirts emos"
```  
*Figure 1*.  Calling methods on objects, using methods from their public interfaces.

We can think of methods to which an object responds as messages that it understands.  When we create a reader methods that returns an object's name attribute, it's equivalent to being able to send the object a message asking for its name.  The same is true for any method that we call on an object—whether that's asking a person object for its name or asking a string to reverse itself (see Figure 1).

Together, all the methods that we can call on an object make up the object's *public interface*, or the messages we can send to the object.  This interface expresses to other developers using our code the behaviors they can expect to rely on—in other words, *what* our object does.  For example, ask a person object for its name, and it will return a string.

Objects can also have a *private interface*—methods accessible only within the object itself.  Private methods are important for *how* an object does what it does; they help an object carry out its responsibilities.  For example, we might create private methods as we refactor a public method, extracting some of its behavior into smaller, more-focused private methods.  

This [blog post][] provides a description of public and private methods, as well as a walk through for defining methods as private.


##Releases

###Release 0 : Initialize It

Define the class `BankAccount`.

It should have three instance variables: `@customer_name`, `@type`, and `@acct_number`.

Define an `initialize` method that takes three arguments and assigns them to the above instance variables.  It should look something like this:

```ruby
my_acct = BankAccount.new("Junipero Serra", "Checking", "347-923-239")
```

###Release 1: Add Functionality

####Redefine to_s

One more requirement: define an instance method `to_s` that will return a string with information about the account.

You will probably come across other classes in Ruby that redefine the built-in method `to_s`.  This is an easy way to display relevant information about an object to the user, and to control which information is conveyed.

As an example, here is one way to display object information:

```ruby
my_acct.to_s
# => "Junipero Serra: Checking# *****3239"
```

Once you define `to_s`, you can interpolate your objects in strings like this:

```ruby
str = "My account information is #{my_acct}"
# => "My account information is Junipero Serra: Checking# *****3239"
```

Write a test for `to_s` to make sure it works as you expect.

#### Define getter methods

When you create a new instance of `BankAccount`, do you have access to any of the values stored in its instance variables?  No?  Good.

The way we get read access to variables stored within a class is through a pattern called a *getter method*.

Which of the instance variables should have associated *getter* methods?

Think about the implications behind defining a getter method.  Which variables should expose themselves in this way?  Which values should be hidden and protected from the outside world?

Write tests for your getter methods.

#### Define setter methods

Now think about which variables should be able to be *written* to.

Then define your setter method(s) and write tests.

#### Hide the account

You probably recognized that it might not be a good idea to expose the account number via a getter or setter method.  That is just the kind of information that should remain private.

Sometimes, though, it is useful to expose part of a value.  If a user has many checking accounts, then it might be useful to display some kind of information that allows them to distinguish between the accounts without seeing the full account number.

How would you get around this problem?  What kind of method can you define that will return enough information about the account to be able to distinguish it from other accounts, without exposing the full number?

And, of course, you know what's coming... write tests!

##Resources

[accessor challenge]: ../../../ruby-drill-accessor-methods-challenge
[blog post]: http://culttt.com/2015/06/03/the-difference-between-public-protected-and-private-methods-in-ruby/
