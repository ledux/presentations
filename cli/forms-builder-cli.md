---
title: forms-builder-cli
author: Lukas Tanner, EF
date: 2024-02-24
---

## Topics
- Anatomy of a cli
- forms-builder-cli

# Anatomy of a cli

## command
```
dotnet new console -n ConsoleApp --framework net8.0 --dry-run
```

## Tokens
 - command
 - subcommand
 - argument
 - option

## command 
```
dotnet new console -n ConsoleApp --framework net8.0 --dry-run
\____/
```

### `dotnet`
the executable

## subcommand 
```
dotnet new console -n ConsoleApp --framework net8.0 --dry-run
       \_/
```
### `new`

- cli input
- action or group of related actions
- can be nested like:

`dotnet tool install`

## option
```
dotnet new console -n ConsoleApp --framework net8.0 --dry-run
                   \/                               \_______/
```
### `-n --name` `--dry-run`
- named parameter
- have typically a prefix 
  - `--` for long version
  - `-` for short version

Why is there a long and a short version?

## argument 
```
dotnet new console -n ConsoleApp --framework net8.0 --dry-run
           \_____/                           \____/
```

### console
- value passed to an option or command
- can have default values 
  - options are often boolean parameters with a default of `true`
    - `--dry-run` == `--dry-run true`
- can have expected values (enum)
  - `dotnet build --verbosity Detailed`
- can have different arity

## arity
Number of values that can be passed to an option or command

| min   | max   | valid?    | example                     |
| :--   | :--   | :----     | :---                        |
| 0     | 0     | valid     | --file                      |
|       |       | invalid   | --file a.json               |
|       |       | invalid   | --file a.json --file b.json |
| ----- | ----- | --------- | --------------------------  |
| 0     | 1     | valid     | --file                      |
|       |       | valid     | --file a.json               |
|       |       | invalid   | --file a.json --file b.json |
| ----- | ----- | --------- | -----------------------     |
| 1     | 1     | valid     | --file a.json               |
|       |       | invalid   | --file                      |
|       |       | invalid   | --file a.json --file b.json |


## arity (cont.)

| min   | max   | valid?    | example                     |
| :--   | :--   | :----     | :---                        |
| 0     | n     | valid     | --file                      |
|       |       | valid     | --file a.json               |
|       |       | valid     | --file a.json --file b.json |
| ----- | ----- | --------- | -----------------------     |
| 1     | n     | invalid   | --file                      |
|       |       | valid     | --file a.json               |
|       |       | valid     | --file a.json --file b.json |


# forms-builder-cli

## examples
### modules
`formsbuilder modules list`

`formsbuilder modules show`

`formsbuilder modules show -n address`

`formsbuilder modules show -n address -m cl -v 1.1`

`formsbuilder modules show -n address -m pt`

`formsbuilder modules show -n age`

## examples (cont.)
### schema


