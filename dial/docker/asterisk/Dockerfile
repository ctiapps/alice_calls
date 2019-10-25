# vim:set ft=dockerfile:
FROM andrius/asterisk

LABEL maintainer="Andrius Kairiukstis <k@andrius.mobi>"

COPY configs/*.conf /etc/asterisk/

CMD ["/usr/sbin/asterisk", "-vvvdddf", "-T", "-W"]
