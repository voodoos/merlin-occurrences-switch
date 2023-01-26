# 🚧 Project-wide occurrences experimental switch
This repository contains scripts and instructions to build a local switch
containing all that's needed to experiment with the upcoming project-wide
occurrences for OCaml code.

## Create a switch to experiment with occurrences

1. Clone this repository
```shell
git clone git@github.com:voodoos/merlin-occurrences-switch.git
```

2. Move to the cloned directory and run `make switch`. This should create a
   local switch with all the necessary pin dependencies.

3. You can then clone a project or create a new one in the switch folder along
   with the `_opam` folder or in subfolders. You will probably need to install
   this project's dependencies in the new switch by colling `opam install .
   --deps-only --with-test`

## Dune-based project indexation

1. Enable indexing in your project by creating (or updating) a `dune-workspace`
   file at its root with the following content:
```lisp
(lang dune 3.5)
(workspace_indexation enabled)
```

2. Build the index with
```shell
dune build @uideps
```
You can then check the index's existence: `_build/default/project.uideps` And
even dump its contents to stdout: `ocaml-uideps dump
_build/default/project.uideps`

3. You should now be able to query for the occurrences of any value or type. In
vscode right-click+`Find All References`. In Emacs `M-x merlin-occurrences`.

## Known issues
- There are issues with vendoring right now.
- Only usages of a value can be used to find all references not its definition
  (yet).
- Index rebuild is needed after each file change.
- Rough UX, no error messages if the index is absent (you can check that
  `_build/default/project.uideps` exists) or if the index needs a refresh, etc.
- Indexation will fail and produce nothing if an external lib whose cmt are not
  installed is used.

## Vscode demo

https://user-images.githubusercontent.com/5031221/214906295-c2c5603c-5f22-4e3a-a93e-b70ebc8e03e9.mov

## Emacs demo

https://user-images.githubusercontent.com/5031221/214906502-171da433-7fc7-4082-94b1-2bfff270b13f.mov
