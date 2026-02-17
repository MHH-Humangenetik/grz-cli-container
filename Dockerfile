ARG GRZ_CLI_VERSION=1.5.1
ARG GRZ_CHECK_VERSION=0.2.1

FROM rust:1.91.1-alpine3.22 AS rust-builder
ARG GRZ_CHECK_VERSION

RUN apk add --no-cache \
		build-base \
    && cargo install --locked --root /usr/local grz-check --version $GRZ_CHECK_VERSION

FROM python:3.13.12-alpine3.22 AS slim
ARG GRZ_CLI_VERSION

RUN pip install --no-cache-dir grz-cli==$GRZ_CLI_VERSION

COPY --from=rust-builder /usr/local/bin/grz-check /usr/local/bin/grz-check

ENTRYPOINT ["grz-cli"]

FROM slim AS nextflow

# install bash, awk, date, grep, ps, sed, tail, tee (https://nextflow.io/docs/latest/reports.html#execution-report-tasks)
RUN apk add --no-cache bash coreutils grep procps sed