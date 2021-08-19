FROM alpine:latest as gh
ARG VERSION=1.14.0

RUN apk --no-cache add wget tar
RUN wget https://github.com/cli/cli/releases/download/v${VERSION}/gh_${VERSION}_linux_amd64.tar.gz
RUN tar -zxvf gh_${VERSION}_linux_amd64.tar.gz
RUN chmod a+x gh_${VERSION}_linux_amd64/bin/gh

FROM alpine:latest
LABEL maintainer="Ross Bannerman <ross@bnnr.mn>"
ARG VERSION=1.14.0
COPY --from=gh gh_${VERSION}_linux_amd64/bin/gh /usr/bin/gh
ENTRYPOINT [ "/usr/bin/gh" ]
