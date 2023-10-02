## The Lapsang Programming Language ##
Lapsang is very much a thought experiment language for me. It's existed for a decade, but in many forms as my tastes, experience and current usage of languages has changed.

This current incarnation is based on the idea of a "rebooted C#". It takes the current set of features as of C#11, plus ideas that are coming in C# 12. It then turns the language on its head turning it into a "pit of success" language:

1. Having two ways of doing the same thing is actively avoided. For example, the `private` keyword is dropped. Members of a class or struct are private by default. Therefore using the optional `private` keyword just adds noise to the code. The other option here would have been to make it mandatory, but where sensible, brevity is favoured over "noisy" explicit clarification in Lapsang.
2. All classes are sealed by default. 
3. Numeric actions are checked by default. Therefore the `checked` keyword is dropped. `unchecked` must be used when unchecked arithmetic is required.
4. Fields and parameters are immutable by default.
5. Local variables are either immutable by default (if an explicit type is specified), or mutable and immutable declarations are available (`mut x = 1;` results in a mutable variable; `val x = 1;` results in an immutable one).
6. Static classes are replaced by modules. A module can only contain static functions, but there is no need to specify `static` everywhere.
7. Static scope is forbidden. It is not possible to define a static field.
8. All fields are private. 

In addition to the above changes, inconsistencies in the language are addressed:

9. As well as supporting exclusive ranges (`1 .. 10` being values 1-9), inclusive ranges are also supported of the form `1 to 9`. `1 to 9 step 2` style ranges are also supported. These inclusive ranges can be used with `foreach`. As such, the basic for loop is not supported (only one way of doing things).
10. Expressions and statements are handled very differently to C# to create better consistency. `{ ... }` - except when used for type declarations - denotes an expression block. An expression block consists of a set of statements, separated by `;`. Optionally, an expression - either of a simple form (eg `x + y` or `x == y`) or another expression block - can be specified after the last `;`. The value of that last expression is then the return value of the expression block. If there is no expression after the last `;` then it is treated as a "void expression block". In keeping with the "only one way of doing things" approach, `return` cannot be used as a last statement in an expression block.
11. As a side effect of point 10, `{{` is not permitted syntax. This allows it to be reserved for future use.

Other aspects of the language are hugely changed. This especially applies to constants, structs and the use of `readonly`:
11.  
12. Constants are completely reimagined.

Not sure where to put yet:
 - no ternary operator. Use if/else or switch
 - favour switch over if/else