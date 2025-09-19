FROM python:3.13.7-alpine3.22

RUN pip install --no-cache-dir grz-cli==1.2.0

ENTRYPOINT ["grz-cli"]