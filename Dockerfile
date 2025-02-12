FROM islasgeci/base:latest
COPY . /workdir
RUN R -e "install.packages(c('optparse', 'reshape2', 'oce'), repos = 'http://cran.rstudio.com')"
RUN R -e "remotes::install_github(c('IslasGECI/optparse', 'IslasGECI/testtools'), upgrade = 'always')"
RUN pip install \
    black \
    codecov \
    flake8 \
    mutmut==2.* \
    pylint \
    pytest \
    pytest-cov
RUN make install 
