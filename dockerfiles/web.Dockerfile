# syntax=docker/dockerfile:1
# FROM python:3.10-bullseye
FROM python:3.10-slim-bullseye

# Create a user
RUN adduser quart

ENV PIP_DISABLE_PIP_VERSION_CHECK=on

# Set working directory for the purpose of this Dockerfile
WORKDIR /home/quart

COPY requirements.txt requirements.txt
RUN python3 -m venv .venv && \
  .venv/bin/pip install --no-cache-dir -r requirements.txt --upgrade && \
  chown -R quart:quart ./

# now copy all the files in this directory to /home/quart
COPY . .

# Listen to port 5000 at runtime
EXPOSE 5000

USER quart
# RUN . .venv/bin/activate
# Define our command to be run when launching the container
# CMD quart run --host 0.0.0.0
CMD [ ".venv/bin/python", "-m" , "quart", "run", "--host=0.0.0.0"]
