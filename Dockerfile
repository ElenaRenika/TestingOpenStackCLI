FROM python:3.9-alpine

RUN apk add gcc libffi-dev
RUN apk add --no-cache --virtual .build-deps gcc musl-dev curl bash

COPY requirements.txt /requirements.txt
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install -r /requirements.txt

WORKDIR /app
ENV PYTHONPATH=/app

ADD src/ost /app/ost
ADD src/tests /app/tests
