## Nullable value types
- since c# 2
- by default not nullable
- reference types WERE nullable

## Nullable reference types
- since c# 8
- reference types were always nullable, so why make this explicit?
	- Now we can explicitly mark reference types as nullable, and therefor enable the compiler to do static checks
	- Shows the intent of the developer
	- Compiler enforces this intent
- nullable and non-nullable types are both represented by the same .NET type


### null-forgiving
```cs
string notNull = "not null";
string? nullable = default;
notNull = nullable!;
```

# How
## Dereferencing
- message.Length will have a warning

## Non-nullable properties III
SetMajor reveals a fundamental problem of OOP: side effects

```cs
private string SetMajor(string? major = null) => major ?? "Undeclared";
```

```cs
public record Student
{
    public string FirstName { get; }
    public string LastName { get; }
    public string Major { get; private set; }

    public Student(string firstName, string lastName, string? major)
    {
        FirstName = firstName;
        LastName = lastName;
        Major = SetMajor(major);
    }

    public Student(string firstName, string lastName)
    {
        FirstName = firstName;
        LastName = lastName;
        Major = SetMajor();
    }

    private string SetMajor(string? major = null) => major ?? "Undeclared";
}
```


## Why enable nullables?
- Null Safety
	- less risk for NullReferenceExceptions
- More explicit code
	- forces the developer to think about his intent
		- should I return null or an empty object?
	- reduces ambiguity
	- improves the understanding of the code


# Migration




# Resources

[Migration strategy](https://learn.microsoft.com/en-us/dotnet/csharp/nullable-migration-strategies)
[Nullable reference types](https://learn.microsoft.com/en-us/dotnet/csharp/nullable-references)
[Tutorial](https://learn.microsoft.com/en-us/dotnet/csharp/tutorials/nullable-reference-types)
[Meaning of the nullable warnings and how to solve them](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/compiler-messages/nullable-warnings)
[Attributes nullable](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/attributes/nullable-analysis)



