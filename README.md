# Starter code for Airflow

# airflowpipes
Useful pipelines using Airflow and Docker.

Table Of Contents

Getting Started

## Environment Variables
please change the following environment variables as necessary

AWS_ACCESS_KEY_ID={ID}
AWS_SECRET_ACCESS_KEY={Secret}
hs_token={token}
metadata_bucket={bucket}
POSTGRES_USER=airflow
POSTGRES_PASSWORD=airflow
POSTGRES_DB=airflow_db
AIRFLOW__CORE__SQL_ALCHEMY_CONN=postgresql+psycopg2://airflow:airflow@postgres:5432/airflow_db
AIRFLOW__CORE__EXECUTOR=LocalExecutor
ADMIN_PASSWORD=admin
AIRFLOW__WEBSERVER__EXPOSE_CONFIG=True


### Metadata Database Deployment

Set up a postgres instance. Please run the commands

```sql
CREATE DATABASE airflow_db;
CREATE USER airflow WITH PASSWORD 'password';
GRANT ALL PRIVILEGES ON DATABASE airflow_db TO airflow;
```





