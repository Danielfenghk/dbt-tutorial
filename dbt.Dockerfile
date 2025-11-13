# Use a stable Debian base instead of testing
FROM python:3.9-slim
#FROM python:3.11

RUN mkdir -p dbt
COPY dbt dbt
RUN pip install -U pip
RUN pip install dbt-postgres


# Add env vars source to bash profile so when we ssh it loads them
RUN echo 'export $(</dbt/.env); cd /dbt;' >> ~/.bashrc


# Install SSH so Airflow can execute commands
RUN apt-get update && \
    apt-get install -y --no-install-recommends git openssh-server && \
	mkdir -p /var/run/sshd && \
	sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*
    


EXPOSE 22
CMD ["sh","-c", "cat /run/secrets/ssh_public_key >> ~/.ssh/authorized_keys && /usr/sbin/sshd -D"]


# Install dbt dependencies
WORKDIR /dbt
RUN dbt deps
