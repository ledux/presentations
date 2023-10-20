---
title: Nullables in C#
author: Lukas Tanner, EF
date: 2023-10-24
---

## Topics
- What are nullables
- How are nullable checked
- How to make use of it
	- PostConditions https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/attributes/nullable-analysis#postconditions-maybenull-and-notnull
	- PreConditions https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/attributes/nullable-analysis#preconditions-allownull-and-disallownull

# What are nullables?

## Nullable value types

```cs
int notNullable = null; // compiler error
Nullable<int> nullable = null // compiles
int? nullableShorthand = null // compiles
```


## Nullable reference types

### Prior to C\# 8
```cs
string nullable = null // compiles
```

### Since C\# 8
```cs
string notNullable = null // compiler warning
string? nullable = null // compiles
```

## Why?

- Enables static compiler analysis
- Less null checks in code --> less CPU cycles



# How the compiler checks the null state

## Null state
- `not-null`
	- the variable has been assigned a value that is known to be _not null_.
	- the variable has been checked against null and wasn't modified since.
		- the variable can be dereferenced safely
- `maybe-null`
	- all other cases
		- the variable must be checked before dereferencing it


## Dereferencing

```cs
string? message = null;
Console.Write($"length: {message.Length}"); // Warning!

Console.Write($"length: {message?.Length}");

message = "hello"
Console.Write($"length: {message.Length}");
```

## Non-nullable properties I
- Must contain a non-nullable value when exiting constructor

### Set default values
```cs
public record Person
{
    public Person(string lastName)
    {
        LastName = lastName;
    }

    public string FirstName { get; } = String.Empty;
    public string LastName { get; }
}
```

## Non-nullable properties II
- Must contain a non-nullable value when exiting constructor

### Constructor chaining
```cs
public record Person
{
    public Person(string lastName) { LastName = lastName; }
	public Person() : this("Cleese")

    public string LastName { get; }
}
```


## Non-nullable properties III
- Compiler doesn't follow into methods


### Nullable Attribute

--> See code
