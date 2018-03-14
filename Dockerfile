######## Stage 1: builder ########

FROM alpine:3.7 as builder

ENV FLUENTBIT_VERSION 0.13-dev-0.10

RUN apk --no-cache add linux-headers build-base cmake curl

WORKDIR /tmp

RUN curl -L https://github.com/fluent/fluent-bit/archive/$FLUENTBIT_VERSION.tar.gz | tar -xz --strip 1
RUN cmake -DFLB_DEBUG=On -DFLB_TRACE=On -DFLB_JEMALLOC=On -DFLB_BUFFERING=On .
RUN make

######## Stage 2: final image ########

FROM alpine:3.7

COPY --from=builder /tmp/bin/fluent-bit /usr/local/bin/fluent-bit

COPY ./conf /etc/fluent

CMD ["/usr/local/bin/fluent-bit", "--config=/etc/fluent/fluent-bit.conf"]
