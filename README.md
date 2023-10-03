## The Lapsang Programming Language ##
Lapsang is very much a thought experiment language for me. It's existed for a decade, but in many forms as my tastes, experience and current usage of languages has changed.

This current incarnation is based on the idea of a "rebooted C#". It takes the current set of features as of C#11, plus ideas that are coming in C# 12. It then turns the language on its head turning it into a "pit of success" language:

1. Having two ways of doing the same thing is actively avoided. For example, the `private` keyword is dropped. Members of a class or struct are private by default. Therefore using the optional `private` keyword just adds noise to the code. The other option here would have been to make it mandatory, but where sensible, brevity is favoured over "noisy" explicit clarification in Lapsang.
2. All classes are sealed by default.
3. Numeric actions are checked by default. Therefore the `checked` keyword is dropped. `unchecked` must be used when unchecked arithmetic is required.
4. Fields and parameters are read-only by default.
5. Local variables are read-only by default (if an explicit type is specified), or mutable and read-only declarations are available (`mut x = 1;` results in a mutable variable; `val x = 1;` results in an immutable one).
6. Static classes are replaced by modules. A module can only contain static functions, but there is no need to specify `static` everywhere.
7. Static scope is forbidden. It is not possible to define a static field.
8. All fields are private.

In addition to the above changes, inconsistencies in the language are addressed:

9. As well as supporting exclusive ranges (`1 .. 10` being values 1-9), inclusive ranges are also supported of the form `1 to 9`. `1 to 9 step 2` style ranges are also supported. These inclusive ranges can be used with `foreach`. As such, the basic for loop is not supported (only one way of doing things).
10. Expressions and statements are handled very differently to C# to create better consistency. `{ ... }` - except when used for type declarations - denotes an expression block. An expression block consists of a set of statements, separated by `;`. Optionally, an expression - either of a simple form (eg `x + y` or `x == y`) or another expression block - can be specified after the last `;`. The value of that last expression is then the return value of the expression block. If there is no expression after the last `;` then it is treated as a "void expression block". In keeping with the "only one way of doing things" approach, `return` cannot be used as a last statement in an expression block.
11. As a side effect of point 10, `{{` is not permitted syntax. This allows it to be reserved for future use.

Other aspects of the language are hugely changed. This especially applies to constants, structs and the use of `readonly`:
12. Constants are completely reimagined. Just don't know how yet.

Breaking changes.
13. One of the biggest issues with C# in 2023 is that it is a complex, bloated language full of old ideas
that cannot be removed that sit alongside newer, better ways of doing things. This is because Microsoft adopt a "no breaking changes" policy most of the time. Lapsang does the opposite: it guarantees there will be breaking changes.
14. Breaking changes will be handled via an escalating warning/explicit error/syntax removal process:
 - Let's say the `fred` keyword is to be added to v6 of lapsang. v5 introduces a warning that `fred` is no longer a valid variable name, with a fixer supplied that renames it to `@fred`. v6 then ups that to an error stating that `fred` is a reserved word and the item should be renamed to `@fred`. Finally, v7 sees that error check and fix stripped out to avoid bloat and technical debtL: the language is then no longer aware that `fred` was ever anything other than a keyword.

Not sure where to put yet:
 - no ternary operator. Use if/else or switch
 - favour switch over if/else