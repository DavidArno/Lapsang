| C# keyword | Lapsang equivalent | Notes|
|--|--|--|
| abstract | not decided | would love to ditch it, but it'll be needed probably |
| add | not needed | Custom event stuff. Not needed |
| alias | not thought about yet | |
| and | && or & if possible | can we avoid a separate keyword for patterns? |
| args | not needed | Top level statement variable. Not a keyword |
| as | avoid if possible | Should be covered by patterns these days |
| ascending | not needed | Linq query language not being replicated |
| async | not needed | await will be a keyword so this trigger word isn't needed |
| await | await | Got to figure out async at some stage |
| base | base | would love to ditch it, but it'll be needed probably |
| bool | bool | |
| break | break | Would like this to fit with expressions in the same way as throw |
| by | not needed | Linq query language not being replicated |
| byte | ubyte | Want to fix the fact that it's the only unsigned type without a u prefix |
| case | not needed | No switch statement in Lapsang |
| catch | catch | |
| char | char maybe | Need to think about utf8 support here |
| checked | not needed | checked by default. Will need an unchecked keyword |
| class | class | |
| const | const | This keyword will hopefully be used to cover off purity |
| continue | continue | Would like this to fit with expressions in the same way as throw |
| decimal | not thought about yet | |
| default | not thought about yet | No switch statement in Lapsang but possibly needed for default values |
| delegate | not thought about yet | |
| descending | not needed | Linq query language not being replicated |
| do | not thought about yet | |
| double | float | would prefer that the float word were used for 64 bit |
| dynamic | not thought about yet | |
| else | else | |
| enum | not decided | would prefer to drop it as want to use enum for value unions |
| equals | not needed | Linq query language not being replicated |
| event | not thought about yet | |
| explicit | not thought about yet | |
| extern | not thought about yet | |
| file | not thought about yet | |
| finally | finally | |
| fixed | not thought about yet | |
| float | shortfloat | |
| for | not needed | no c-style for loop in Lapsang |
| foreach | for | All for loops are foreach loops in Lapsang so use the shorter term |
| from | not needed | Linq query language not being replicated |
| get | get | |
| global |not thought about yet | |
| goto | not decided | would love to ditch it, but it'll be needed probably |
| group | not needed | Linq query language not being replicated |
| if | if | |
| implicit| not thought about yet | |
| in | not needed | Linq query language not being replicated |
| init | not thought about yet | I'd love to scrap the whole construct/initialize mess, but not sure if possible |
| int | int | |
| interface | interface | |
| internal | internal | |
| into | not needed | Linq query language not being replicated |
| is | is | |
| join| not needed | Linq query language not being replicated |
| let | not needed | Linq query language not being replicated |
| lock | not thought about yet | |
| long | long | |
| managed | not thought about yet | |
| nameof | not thought about yet | |
| namespace | namespace, maybe | Could make this part of the type name? |
| new | new | |
| nint | not thought about yet | |
| not | not | |
| notnull | not thought about yet | |
| nuint | not thought about yet | |
| null | null | |
| object | object | |
| on | not needed | Linq query language not being replicated |
| operator | not thought about yet| |
| or | or? | Pattern keywords need thinking about |
| orderby | not needed | Linq query language not being replicated |
| out| not thought about yet | would love to ditch it, but it'll be needed probably |
| override | not thought about yet | would love to ditch it, but it'll be needed probably ||
| params | not thought about yet | |
| partial| not thought about yet | would love to ditch it, but it'll be needed probably |
| private | not needed | private by default so just noise. Ditch it |
| protected | not thought about yet | would love to ditch it, but it'll be needed probably |
| public | public | |
| readonly | mut | things will be readonly by default so a `mut` keyword will be needed for not read-only |
| record | record, probably, maybe | |
| ref |not thought about yet | |
| remove | not needed | Custom event stuff. Not needed |
| required | not thought about yet | all part of the initialisation mess. Needs a real rethink |
| return | return | Only needed as a statement as expression blocks return the end value |
| sbyte | sbyte | ubyte and sbyte. Dropping the s on the latter will confuse people |
| scoped | not thought about yet | |
| sealed | inheritable | all classes will be sealed by default so just need a way of saying "not sealed" |
| select | not needed | Linq query language not being replicated |
| set | set | |
| short | short | |
|sizeof|||
|stackalloc|||
|static|||
|string|||
|struct|||
|switch|||
|this|||
|throw|||
|try|||
|typeof|||
|uint|||
|ulong|||
|unchecked|||
|unmanaged|||
|unsafe|||
|ushort|||
|using|||
|value|||
|var|||
|virtual|||
|void|||
|volatile|||
|when|||
|where|||
|while|||
|with|||
|yield|||
||||