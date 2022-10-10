FROM islasgeci/base:latest
COPY . /workdir
RUN R -e "install.packages(c('optparse', 'reshape2'), repos = 'http://cran.rstudio.com')"
RUN pip install \
    black \
    codecov \
    flake8 \
    mutmut \
    pylint \
    pytest \
    pytest-cov
RUN make install 
