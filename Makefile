_opam:
	opam switch create . --empty

opam.export: _opam
	opam pin --yes \
	https://github.com/voodoos/ocaml.git#store-index-in-cmt-501
	opam pin  --with-version 3.7 --yes \
	https://github.com/voodoos/dune.git#ocaml-uideps
	opam pin --with-version dev --yes \
	https://github.com/voodoos/ocaml-uideps.git#rework
	opam pin --with-version 4.10 --yes \
	https://github.com/voodoos/merlin.git#501+index-in-cmt
	opam pin --with-version dev --yes \
	https://github.com/voodoos/ocaml-lsp.git#project-occurrences
	opam switch export --freeze  opam.export

switch: _opam
	opam switch import opam.export --switch=.
