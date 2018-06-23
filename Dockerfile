FROM ruby:2.5.1-stretch
RUN mkdir -p /workspace

WORKDIR /workspace

COPY install /install

# Install node required by locomotive and many project
RUN DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y nodejs vim \
    && /install/gosu.sh \
    && apt-get clean \
    && ln -sf /usr/bin/nodejs /usr/bin/node

COPY stack/entrypoint /usr/local/bin/entrypoint
COPY stack/bash_aliases /stack/bash_aliases

ENV LANG C.UTF-8
ENTRYPOINT ["/usr/local/bin/entrypoint"]
EXPOSE 3000
EXPOSE 3333
