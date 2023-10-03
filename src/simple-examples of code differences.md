```cs
var names = new List<string>() { "John", "Tom", "Peter" };
foreach (string name in names)
{
    if (name == "Tom")
    {
        continue;
    }
    Console.WriteLine(name);
}
```

```lapsang
val names = {{"John", "Tom", "Peter"}};
foreach val name in names {
    if (name == "Tom") continue;
    Console.WriteLine(name);
};
```

```cs
int i = 1;

switch (i)
{
    case 1:
        Console.WriteLine("One");
        break;
    case 2:
        Console.WriteLine("Two");
        Console.WriteLine("Two");
        break;
    default:
        Console.WriteLine("Other");
        break;
}
```

```lapsang
val i = 1;
i switch (
    (1) { Console.WriteLine("One"); }
    (2) {
        Console.WriteLine("Two");
        Console.WriteLine("Two");
    }
    (_) { Console.WriteLine("Other"); }
);
```

```cs
int time = 22;
if (time < 10)
{
  Console.WriteLine("Good morning.");
}
else if (time < 20)
{
  Console.WriteLine("Good day.");
}
else
{
  Console.WriteLine("Good evening.");
}
```

```lapsang
// V1
val time = 22;
time switch (
    (< 10) { Console.WriteLine("Good morning."); }
    (< 20) { Console.WriteLine("Good day."); }
    (_) { Console.WriteLine("Good evening."); }
);

// V2
// Following the "only one way" principle, this will warn that switch should be used instead
val time = 22;
if (time < 10) { Console.WriteLine("Good morning."); }
elseif (time < 20) { Console.WriteLine("Good day."); }
else { Console.WriteLine("Good evening."); };
```

```cs
int time = 20;
string result = (time < 18) ? "Good day." : "Good evening.";
Console.WriteLine(result);
```

```lapsang
val time = 20;
val result = if (time < 18) "Good day." else "Good evening.";
Console.WriteLine(result);
```

```cs
var teenStudentsName = from s in studentList
                       where s.age > 12 && s.age < 20
                       select new { StudentName = s.StudentName };

teenStudentsName.ToList().ForEach(s => Console.WriteLine(s.StudentName));
```

```lapsang
val teenStudentsName = foreach val s in studentList {
    if (s.age <= 12 or >= 20) continue
    (s.StudentName,)
};

foreach student in teenStudentsName { Console.WriteLine(student.StudentName); };
```


```cs
int val;
public int Value
{
    get =>
        try
        {
            DoSomething();
            return val;
        }
        catch(Exception e)
        {
        };

    set =>
        try
        {
           DoSomething(value);
           val = value;
        }
        catch(Exception e)
        {
            Console.WriteLine("Set value " + value);
        };
}
```

```lapsang
public int Value (
    get => try { DoSomething(); field } catch {}
    set =>
        try { DoSomething(); field = value; }
        catch (Exception e) {
            Console.WriteLine($"Setting value {value} gave error {e}");
        }
)
```

```cs
int val;

public int GetIncrementedValue()
{
    try
    {
        return val += 10;
    }
    catch (OverflowException e)
    {
        Console.WriteLine(e);
        throw;
    }
}

```

```lapsang
mut int Val;

public int GetIncrementedValue() =>
    try Val += 10 catch (OverflowException e) { Console.WriteLine(e); throw }
```

```cs
public uint GetUnsafeIncrementedValue(uint i)
{
    try
    {
        return i + 1;
    }
    catch (OverflowException e)
    {
        return 0;
    }
}

```

```lapsang
public uint GetUnsafeIncrementedValue(uint i) =>
    try i + 1 catch (OverflowException) 0
```


```cs
static string CreateRow(int n, int offset)
{
    const string PatternTemplate =
        "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890" +
        "987654321098765432109876543210987654321098765432109876543210987654321098765432109876543210987654321";

    const string PaddingTemplate =
        "                                                                                                   ";

    var padding = PaddingTemplate[..offset];
    return padding + PatternTemplate[..(n - offset)] + PatternTemplate[^(n - (offset + 1))..] + padding;
}

static List<string> SystemUnderTest(int n)
{
    var rows = n * 2 - 1;
    var pattern = new List<string>(rows);

    for (var i = 0; i < rows; i++)
    {
        var offset = i < n ? n - i - 1 : i - n + 1;
        pattern.Add(CreateRow(n, offset));
    }

    return pattern;
}
```

```lapsang
static string CreateRow(int N, int Offset) => {
    const PatternTemplate =
        "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890" +
        "987654321098765432109876543210987654321098765432109876543210987654321098765432109876543210987654321";

    const PaddingTemplate =
        "                                                                                                   ";

    val padding = PaddingTemplate[..Offset];
    padding + PatternTemplate[..(N - Offset)] + PatternTemplate[^(N - (Offset + 1))..] + Padding
}

// V1
static List<string> SystemUnderTest(int N) => {
    val rows = N * 2 - 1;

    foreach i in (0 .. rows) {
        val offset = if (i < N) N - i - 1 else i - N + 1;
        CreateRow(N, offset)
    }.ToList()
}

// V2
static List<string> SystemUnderTest(int N) =>
    (foreach i in (0 .. N * 2 - 1) CreateRow(N, if (i < N) N - i - 1 else i - N + 1)).ToList()
```

```cs
try
{
    Console.WriteLine(Divide(10, 10));
}
catch (MyException e) when (e.Message.Contains("awkward"))
{
    Console.WriteLine($"Well this is not what I expected: {e.Message}");
}
catch (MyException e) when (e.Message.Contains("exactly"))
{
    Console.WriteLine($"Well something else has happened: {e.Message}");
}
catch (Exception e)
{
    Console.WriteLine($"This was not really handled!");
}
finally
{
    Console.WriteLine("I'm gonna be executed anyway!");
}
```

```lapsang
try { Console.WriteLine(Divide(10, 10)); }
catch (
    (MyException e when e.Message.Contains("awkward")) {
        Console.WriteLine($"Well this is not what I expected: {e.Message}");
    }
    (MyException e when e.Message.Contains("exactly")) {
        Console.WriteLine($"Well something else has happened: {e.Message}");
    }
    (Exception e) {
        Console.WriteLine($"This was not really handled!");
    }
)
finally { Console.WriteLine("I'm gonna be executed anyway!"); }
```

```cs
private void PrintHello() => Console.WriteLine("Hello, world");
```

```lapsang
void PrintHello() => { Console.WriteLine("Hello, world"); }
```