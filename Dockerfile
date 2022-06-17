FROM islasgeci/base:latest
COPY . /workdir
RUN R -e "install.packages(c('devtools', 'optparse', 'reshape2', 'styler'), repos = 'http://cran.rstudio.com')"
RUN R -e "devtools::install_github('klutometis/roxygen', upgrade = FALSE)"
RUN pip install \
    black \
    codecov \
    flake8 \
    mutmut \
    pylint \
    pytest \
    pytest-cov
RUN make install 
