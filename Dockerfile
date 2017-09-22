FROM ubuntu AS compiler

RUN apt-get update
RUN apt-get -y install cmake autoconf
RUN apt-get -y install gcc g++
RUN apt-get -y install git
COPY . /wakaama
WORKDIR /wakaama/build-dtlsclient
RUN cmake -DDTLS=1 ../examples/client
RUN make

FROM ubuntu 
COPY --from=compiler /wakaama/build-dtlsclient/lwm2mclient . 

