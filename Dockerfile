FROM rocker/tidyverse

RUN apt-get update && apt-get install -y pandoc
RUN R -e "install.packages(c('rmarkdown','here'), repos='https://cloud.r-project.org')"

WORKDIR /project

COPY data data
COPY code code
COPY report.Rmd .
COPY Makefile .

RUN mkdir -p /project/report

CMD ["Rscript", "-e", "rmarkdown::render('report.Rmd', output_dir='/project/report')"]