FROM alpine:latest as gh
RUN apk --no-cache add wget tar
RUN wget https://github.com/cli/cli/releases/download/v0.5.7/gh_0.5.7_linux_amd64.tar.gz
RUN tar -zxvf gh_0.5.7_linux_amd64.tar.gz
RUN chmod a+x gh_0.5.7_linux_amd64/bin/gh

LABEL maintainer="Ross Bannerman <ross@bnnr.mn>"

FROM alpine:latest
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
COPY --from=gh gh_0.5.7_linux_amd64/bin/gh /usr/bin/gh
ENTRYPOINT [ "/usr/bin/gh" ]