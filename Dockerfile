FROM islasgeci/base:0.7.0
COPY . /workdir
RUN R -e "install.packages(c('devtools', 'optparse', 'reshape2', 'styler'), repos = 'http://cran.rstudio.com')"
RUN R -e "devtools::install_github('klutometis/roxygen', upgrade = FALSE)"
RUN pip install \
    black \
    pytest
