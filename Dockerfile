FROM ubuntu:18.04

	# [ init ]

RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y

	# [ pre-requisites ]

RUN apt-get install -y build-essential git cmake automake
RUN apt-get install -y libcurl4-openssl-dev libx11-dev libavahi-compat-libdnssd-dev libxtst-dev qtbase5-dev libssl-dev
RUN git clone https://github.com/debauchee/barrier.git /root/src/barrier

	# [ configuration / modification ]

RUN export CFLAGS="$CFLAGS -Wall -Wextra -O3 -march=native"
RUN export CXXFLAGS="$CXXFLAGS -Wall -Wextra -O3 -march=native"
RUN export CCFLAGS="$CCFLAGS -Wall -Wextra -O3 -march=native"
RUN sed -i 's/Debug/Release/g' /root/src/barrier/clean_build.sh
RUN mkdir -p /root/src/barrier/bin/

	# [ build ]

RUN /root/src/barrier/clean_build.sh
WORKDIR /root/src/barrier/build/
RUN make

	# [ entrypoint ]

ENTRYPOINT make DESTDIR=/root/src/barrier/bin/ install

	# mkdir -p $HOME/barrier-bin/ && docker run --volume=$HOME/barrier-bin/:/root/src/barrier/bin/ --tty barrier:test
	# cp -r $HOME/barrier-bin/usr/ / && cp -r $HOME/barrier-bin/share/ /
