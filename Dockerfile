ARG GRZ_CLI_VERSION=2.0.0

FROM python:3.15.0-alpine3.24 AS slim
ARG GRZ_CLI_VERSION

RUN apk add --no-cache \
		build-base && \
    pip install --no-cache-dir grz-cli==$GRZ_CLI_VERSION

ENTRYPOINT ["grz-cli"]

FROM slim AS nextflow

# install bash, awk, date, grep, ps, sed, tail, tee (https://nextflow.io/docs/latest/reports.html#execution-report-tasks)
RUN apk add --no-cache bash coreutils grep procps sed