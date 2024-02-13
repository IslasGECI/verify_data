FROM islasgeci/base:latest
COPY . /workdir
RUN R -e "install.packages(c('optparse', 'reshape2'), repos = 'http://cran.rstudio.com')"
RUN R -e "remotes::install_github('IslasGECI/optparse', 'IslasGECI/testtools', upgrade = 'always')"
RUN pip install \
    black \
    codecov \
    flake8 \
    mutmut \
    pylint \
    pytest \
    pytest-cov
RUN make install 
