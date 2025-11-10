ARG GRZ_CLI_VERSION=1.5.0
ARG GRZ_CHECK_VERSION=0.2.0

FROM python:3.13.9-alpine3.22 AS slim

RUN apk add --no-cache cargo && cargo install --root /usr/local grz-check@$GRZ_CHECK_VERSION
RUN pip install --no-cache-dir grz-cli==$GRZ_CLI_VERSION

ENTRYPOINT ["grz-cli"]

FROM slim AS nextflow

# install bash, awk, date, grep, ps, sed, tail, tee (https://nextflow.io/docs/latest/reports.html#execution-report-tasks)
RUN apk add --no-cache bash coreutils grep procps sed