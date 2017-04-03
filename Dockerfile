FROM alpine:3.5

# http://fluentbit.io/documentation/0.11/installation/build_install.html

# FIXME compile with Jemalloc enabled
# http://fluentbit.io/documentation/0.11/configuration/memory_usage.html

RUN apk --no-cache add --virtual .build-deps \
    curl cmake build-base \
  && cd /tmp \
  && curl -L https://github.com/fluent/fluent-bit/archive/v0.11.0.tar.gz \
    | tar -xz --strip 1 \
  && cmake -Wno-dev . \
  && make \
  && make install \
  && rm -r /usr/local/include \
  && rm -r /tmp/* \
  && apk del .build-deps

COPY ./conf /etc/fluent

# USER nobody:nobody
CMD ["fluent-bit", "--config=/etc/fluent/fluent-bit.conf"]
