FROM alpine:3.12
RUN apk add --no-cache grep
WORKDIR /app/
COPY entrypoint.sh /sh/
ENTRYPOINT [ "sh", "/sh/entrypoint.sh" ]