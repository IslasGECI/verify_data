FROM islasgeci/base:0.7.0
COPY . /workdir
RUN R -e "install.packages(c('devtools', 'optparse', 'styler'), repos = 'http://cran.rstudio.com')"
RUN R -e "devtools::install_github('klutometis/roxygen', upgrade = FALSE)"
RUN pip install \
    black \
    pytest
RUN R CMD build diferenciasMorfometriaPosicionTrampas && \
    R CMD INSTALL diferenciasMorfometriaPosicionTrampas_1.0.tar.gz
