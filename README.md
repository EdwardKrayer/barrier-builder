# barrier-builder
Dockerfile for creating build environment and compilation of Barrier, an open-source KVM software forked from Symless's synergy 1.9 codebase

## Description:

Docker image to build barrier binaries from their latest source.

## Usage Instructions:

Execute the following to build Barrier binaries from source, the binaries will be placed in the "barrier-bin" directory at the path specified by environmental variable BARRIER_DIR at line 4. In this example, binaries will be places at ~/barrier-bin/ after all instruction are completed.

	git clone https://github.com/EdwardKrayer/barrier-builder.git
	cd barrier-builder
	docker build --tag=$USER/barrier-builder:latest - < Dockerfile
	export BARRIER_DIR=~/
	mkdir -p $HOME/barrier-bin/
	docker run --volume=$HOME/barrier-bin/:/root/src/barrier/bin/ --tty $USER/barrier-builder:latest

## Installation Instructions:

	sudo apt-get install libavahi-compat-libdnssd1
	cd $BARRIER_DIR/barrier-bin
	sudo cp -r ./usr/ /

	