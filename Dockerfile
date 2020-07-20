FROM islasgeci/base:89e5
RUN R -e "install.packages(c('devtools','optparse','testthat'), repos = 'http://cran.rstudio.com')"
RUN R -e "devtools::install_github('klutometis/roxygen', upgrade = FALSE)"
RUN pip install git+https://github.com/IslasGECI/descarga_datos.git@v0.1.0-beta
RUN pip install pytest
RUN pip install --upgrade --force-reinstall csvkit
RUN git clone https://github.com/IslasGECI/queries.git && \
cd queries && \
make install
