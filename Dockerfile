# build on base image from https://hub.docker.com/r/rocker/shiny
FROM rocker/shiny:latest

LABEL maintainer="meenchulkim"

# set working directory
WORKDIR app/

# copy necessary files
COPY ui.R server.R ./
COPY ./data ./data
COPY ./scripts/run_app.sh ./

# expose port
EXPOSE 3838

# run app on container start
CMD ["./run_app.sh"]
