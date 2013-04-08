## The Lapsang Programming Language ##
Lapsang is a concept language,which seeks to build a range of modern language "best practices" in to the core language, rather than them existing only as add-on frameworks.

### Core "best practice" language features ###
- For a unit of Lapsang code to compile, it must be tested. What this means in practice is that unit tests have to be a fundamental feature of the language, rather than a framework library that the code compiles against. The compiler runs the tests and profiles the code. Failed tests, or code not covered by those tests, are then both treated as compiler errors.
- Lapsang mandates design to interfaces. To give an example of how thoroughly it mandates this pattern, code (outside of tests) cannot create an instance of another class, it must create an instance of an interface. Dependency injection is used to provide the desired class, that implements that interface, to that code at compile time/runtime.
- Lapsang supports classes, but doesn’t allow inheritance. Instead, composition is king. Any object (which includes interface references, functions and primitives) can have components added to it, even at runtime. Again, this pattern is baked into the language: Inversion of control/entity frameworks are not required to set up composed objects, at least at a basic level.
- Lapsang supports structured typing. This means that classes (and primitives and functions) do not need to pre-declare that they implement interfaces. Instead they implicitly implement an interface if they satisfy that interface’s contract.
- Lapsang encourages the use of immutable data types and functions/methods without side effects. Mutability is allowed, in recognition of the fact that its an essential feature at times, but such code has to be explicitly annotated as unsafe.

### Where's the compiler? ###
Lapsang really only exists as a concept language. The syntax is poorly defined (see the far-from-complete /ebnf/language.ebnf file for details) and there are a few half-written core framework files (beneath /coreFramework). That's it at present.

### Reading more about Lapsang ###
I've written a series of blog posts on Lapsang:

- [Lapsang: does the world need yet another programming language?](http://www.davidarno.org/2012/12/03/lapsang-does-the-world-need-yet-another-programming-language/)

[http://www.davidarno.org/2013/01/16/lapsang-design-to-interfaces-and-dependency-injection-language-features/](http://www.davidarno.org/2013/01/16/lapsang-design-to-interfaces-and-dependency-injection-language-features/ " Lapsang: “design to interfaces” and “dependency injection” language features ")
- [http://www.davidarno.org/2013/01/25/testing-with-lapsang/](http://www.davidarno.org/2013/01/25/testing-with-lapsang/ "Testing with Lapsang")
- [http://www.davidarno.org/2013/02/25/how-lapsang-avoids-two-common-forms-of-explicit-casting/](http://www.davidarno.org/2013/02/25/how-lapsang-avoids-two-common-forms-of-explicit-casting/ "How Lapsang avoids two common forms of explicit casting")