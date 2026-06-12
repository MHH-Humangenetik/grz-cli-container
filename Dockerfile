ARG GRZ_CLI_VERSION=1.7.2

FROM python:3.14.6-alpine3.24 AS slim
ARG GRZ_CLI_VERSION

RUN apk add --no-cache \
		build-base && \
    pip install --no-cache-dir grz-cli==$GRZ_CLI_VERSION && \
    apk del --no-cache build-base

ENTRYPOINT ["grz-cli"]

FROM slim AS nextflow

# install bash, awk, date, grep, ps, sed, tail, tee (https://nextflow.io/docs/latest/reports.html#execution-report-tasks)
RUN apk add --no-cache bash coreutils grep procps sed