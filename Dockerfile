FROM islasgeci/base:13fe
COPY . /workdir
RUN R -e "install.packages(c('devtools','optparse','testthat'), repos = 'http://cran.rstudio.com')"
RUN R -e "devtools::install_github('klutometis/roxygen', upgrade = FALSE)"
RUN pip install \
    git+https://github.com/IslasGECI/descarga_datos.git@v0.1.0-beta \
    git+https://github.com/IslasGECI/analytictools.git@849e111d90f8b251628d97123da507d92196f0eb
RUN pip install \
    black \
    pytest
RUN pip install --upgrade --force-reinstall csvkit
RUN git clone https://github.com/IslasGECI/queries.git && \
cd queries && \
make install
