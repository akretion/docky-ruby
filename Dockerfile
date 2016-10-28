FROM ruby:latest
RUN mkdir -p /workspace &&\
    adduser ubuntu
WORKDIR /workspace
COPY stack/entrypoint /usr/local/bin/entrypoint
COPY stack/bash_aliases /home/developer/.bash_aliases
RUN rm -rf /usr/local/bundle && ln -s /workspace/bundle /usr/local/bundle

# Install node required by locomotive and many project
RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y nodejs && \
    apt-get clean && \
    ln -sf /usr/bin/nodejs /usr/bin/node

ENTRYPOINT ["/usr/local/bin/entrypoint"]
USER ubuntu
