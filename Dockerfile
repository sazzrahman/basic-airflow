FROM python:3.9.5-slim
LABEL maintainer="Sazz"

ARG AIRFLOW_VERSION=2.5.3
ARG AIRFLOW_HOME=/opt/airflow

ENV AIRFLOW_HOME=${AIRFLOW_HOME}

RUN apt-get update -yqq && \
    apt-get upgrade -yqq && \
    apt-get install -yqq --no-install-recommends \
    wget \
    libczmq-dev \
    curl \
    libssl-dev \
    git \
    inetutils-telnet \
    bind9utils freetds-dev \
    libkrb5-dev \
    libsasl2-dev \
    libpq-dev \
    freetds-bin build-essential \
    default-libmysqlclient-dev \
    apt-utils \
    rsync \
    zip \
    unzip \
    gcc \
    vim \
    locales \
    && apt-get clean

COPY ./requirements.txt /requirements.txt

RUN pip install --upgrade pip && \
    useradd -ms /bin/bash -d ${AIRFLOW_HOME} airflow && \
    pip install apache-airflow[postgres]==${AIRFLOW_VERSION}  &&\
    pip install -r requirements.txt

# Copy dbt profile

COPY ./entrypoint.sh ./entrypoint.sh


RUN chmod +x ./entrypoint.sh
RUN chown -R airflow: ${AIRFLOW_HOME}

USER airflow

WORKDIR ${AIRFLOW_HOME}

COPY mnt/airflow/dags/ dags/


EXPOSE 8080


ENTRYPOINT ["/entrypoint.sh"]
