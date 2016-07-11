FROM ruby:latest
RUN mkdir -p /workspace &&\
    adduser developer
WORKDIR /workspace
COPY stack/entrypoint /usr/local/bin/entrypoint
COPY stack/bash_aliases /home/developer/.bash_aliases
RUN rm -rf /usr/local/bundle && ln -s /workspace/bundle /usr/local/bundle
ENTRYPOINT ["/usr/local/bin/entrypoint"]
USER developer
