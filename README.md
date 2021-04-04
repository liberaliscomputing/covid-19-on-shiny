# COVID-19 on Shiny

The **COVID-19 on Shiny** is a web application built with [R Shiny](https://shiny.rstudio.com/) and [Synthea](https://github.com/synthetichealth/synthea).

## Quickstart

### Running the Application in a Docker Network

1. Make sure [Docker](https://www.docker.com/) is installed.

2. Clone this repository:

```bash
$ git clone git@github.com:liberaliscomputing/covid-19-on-shiny.git
$ cd covid-19-on-shiny
```

3. Build a Docker image:

```bash
docker build -t covid-19-on-shiny .
```

4. Run a container:

```bash
$ docker run -d --name covid-19-on-shiny --rm -p 3838:3838 covid-19-on-shiny
```

5. Browse the application at http://localhost:3838.

## Dataset

The COVID-19 on Shiny allows you to browse, query, and download synthetic COVID-19 data in pediatrics generated against the [HL7 FHIR R4](http://hl7.org/fhir/R4/index.html) specification. Currently, the following profiles are supported:

- [Patient](https://www.hl7.org/fhir/patient.html)
- [Encounter](https://www.hl7.org/fhir/encounter.html)
- [Condition](https://www.hl7.org/fhir/condition.html)
- [Procedure](https://www.hl7.org/fhir/procedure.html)
