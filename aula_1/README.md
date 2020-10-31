# 1st Lesson

## Example

### Create Database

```prolog
| ?- [user].                            
compiling user for byte code...
homem(joao).
mulher(maria).
progenitor(joao,maria).
pai(X,Y):-homem(X),progenitor(X,Y).
```

### Queries

- `homem(X).`
- `homem(X),mulher(X).`
-  `pai(joao,X).`
-  `pai(X,maria).`
-  `pai(X,Y).`