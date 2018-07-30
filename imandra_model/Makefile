run-node: build-node
	_build/default/src-node/rosnode.bc 

dev-setup:
	opam install -y dune
	opam install -y ZMQ lwt lwt-zmq yojson

.PHONY: build-node 
build-node:
	dune build ./src-node/rosnode.bc



