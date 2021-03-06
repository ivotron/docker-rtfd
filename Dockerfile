FROM alpine:3.4

RUN set -xe \
    && apk --no-cache add \
        bash \
        enchant \
        aspell-en \
        git \
        make \
        python \
        py-pip \
        inotify-tools

COPY requirements.txt .

RUN pip install -r requirements.txt --no-cache-dir

WORKDIR /doc

VOLUME ["/doc"]

CMD ["/bin/bash"]

COPY entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
