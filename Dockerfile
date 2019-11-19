FROM alpine:3.10 as build
MAINTAINER "Vitali Khlebko vitali.khlebko@vetal.ca"

ENV version=1.1pre17


RUN apk update && apk add gcc g++ make &&\
	cd /tmp && wget http://www.tinc-vpn.org/packages/tinc-${tincversion}.tar.gz &&\
    tar xzvf tinc-${tincversion}.tar.gz && \
    cd tinc-${version} && \
	./configure --prefix=/usr --enable-jumbograms --enable-tunemu --sysconfdir=/etc --localstatedir=/var
	
RUN cd /tmp/tinc-${version} && make