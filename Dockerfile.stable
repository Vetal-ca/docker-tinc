FROM alpine:3.10 as build
MAINTAINER "Vitali Khlebko vitali.khlebko@vetal.ca"

ENV version=1.0.35


RUN apk update && apk add gcc g++ make ncurses-dev linux-headers readline-dev zlib-dev lzo-dev openssl-dev libpcap-dev &&\
	cd /tmp && wget http://www.tinc-vpn.org/packages/tinc-${version}.tar.gz &&\
    tar xzvf tinc-${version}.tar.gz && \
    cd tinc-${version} && \
	./configure --prefix=/usr --enable-jumbograms --enable-tunemu --sysconfdir=/etc --localstatedir=/var &&\
	make && make install src

FROM alpine:3.10

COPY --from=build /usr/sbin/tincd /usr/sbin/tincd
COPY --from=build /usr/share/info/tinc.info /usr/share/info/tinc.info
COPY --from=build /usr/share/man/man5/tinc.conf.5 /usr/share/man/man5/tinc.conf.5
COPY --from=build usr/share/man/man8/tincd.8 /usr/share/man/man8/tincd.8

RUN mkdir -p /etc/tinc && apk update && apk add readline ncurses lzo

ENTRYPOINT ["/usr/sbin/tincd"]
