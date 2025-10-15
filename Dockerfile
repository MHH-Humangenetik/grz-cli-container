FROM python:3.13.7-alpine3.22

RUN apk add --no-cache cargo && cargo install --root /usr/local grz-check@0.1.0
RUN pip install --no-cache-dir grz-cli==1.3.1

ENTRYPOINT ["grz-cli"]