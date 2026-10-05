# Constraints Programming: Practical Work

Practical work (TPs) for the Constraints Programming module. Each lab models a problem as a set of variables, domains and constraints and solves it with a constraint solver.

## Repository structure

```
.
├── TP 1/    # Practical work 1
├── TP 2/    # Practical work 2
├── TP 3/    # Practical work 3
├── TP 4/    # Practical work 4
└── README.md
```

## Constraint programming in a nutshell

A problem is described declaratively:

- **Variables**: the unknowns to find.
- **Domains**: the values each variable can take.
- **Constraints**: the relations the values must satisfy together.

The solver searches for assignments that satisfy every constraint (and, for optimization problems, minimizes or maximizes an objective), combining constraint propagation with backtracking search.

## Getting started

```bash
git clone https://github.com/sarahmoussaoui/Constraints-Programming-Practical-Work.git
cd Constraints-Programming-Practical-Work
```

Each TP folder is self-contained: open it, read the problem statement and model files it contains, and run the model with the solver used in the lab.

## Repository layout

Folder names contain a space (`TP 1`, `TP 2`, ...), so wrap them in quotes on the command line:

```bash
cd "TP 1"
```
