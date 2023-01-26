_opam:
	opam switch create . --empty

opam.export: _opam
	opam pin --yes \
	https://github.com/voodoos/ocaml.git#store-shapes-in-summaries+fragments
	opam pin https://github.com/voodoos/dune.git#ocaml-uideps \
	--yes
	opam pin --yes \
	https://github.com/voodoos/ocaml-uideps.git
	opam pin --yes \
	https://github.com/voodoos/merlin.git#project-wide-occurrences
	opam pin --with-version dev --yes \
	https://github.com/voodoos/ocaml-lsp.git#project-wide-occurrences
	opam switch export --freeze  opam.export

switch: _opam
	opam switch import opam.export --switch=.
