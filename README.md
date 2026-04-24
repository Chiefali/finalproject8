# Final Project 8

## Project Overview

This project builds a containerized R Markdown report using Docker.  
The report is generated automatically and saved to a local folder.

## DockerHub Image

https://hub.docker.com/r/jdali/finalproject8

## Build the Docker Image

```bash
docker build -t jdali/finalproject8 .
```

## Build report in container

```bash
make docker_report
```
