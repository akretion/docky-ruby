FROM ruby:latest
RUN mkdir -p /workspace &&\
    adduser developer
WORKDIR /workspace
COPY stack/entrypoint /usr/local/bin/entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint"]
USER developer
ENV GEM_HOME="/workspace/gems"
ENV PATH=$PATH:/workspace/gems/bin
