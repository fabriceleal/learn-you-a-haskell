# Learn you a haskell
http://learnyouahaskell.com/

## On ghci

### Load file

```
ghci> :l file
```

*Don't need to add the .hs extension*

### Reload loaded files

```
ghci> :r
```

### Check the type of a value

```
ghci> :t <value>
```

### Check the kind of a type

```
ghci> :k <type>
```

### Quit from ghci

```
ghci> :quit
```

## Import module

```
ghci> :m + <module.name>
```

Like this:

```
ghci> :m + Data.List
```

## Compile

```
ghc --make file_no_extension
```

## Run immediately

```
runhaskell file_no_extension
```
