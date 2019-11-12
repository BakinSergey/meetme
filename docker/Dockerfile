FROM python:3.7-alpine
ENV PYTHONUNBUFFERED=1

COPY . /usr/src/app/

WORKDIR /usr/src/app

RUN \
    apk add postgresql-libs && \
    apk add --virtual .build-deps gcc musl-dev zlib-dev jpeg-dev postgresql-dev python3-dev libffi-dev openssl-dev && \
    apk add g++

RUN pip install pipenv && \
    pipenv lock -r > ./requirements.txt && \
    pipenv lock -r --dev > ./requirements_dev.txt

RUN pip install -r ./requirements.txt && \
    pip install -r ./requirements_dev.txt

# RUN addgroup -S domofon && adduser -S sip_user -G dofmofon
# USER sip_user

EXPOSE 8000