FROM python:3.13.7-alpine3.22 AS slim

RUN apk add --no-cache cargo && cargo install --root /usr/local grz-check@0.1.0
RUN pip install --no-cache-dir grz-cli==1.3.1

ENTRYPOINT ["grz-cli"]

FROM slim AS nextflow

# install bash, awk, date, grep, ps, sed, tail, tee (https://nextflow.io/docs/latest/reports.html#execution-report-tasks)
RUN apk add --no-cache bash coreutils grep procps sed