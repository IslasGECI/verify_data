FROM islasgeci/base:56ca
RUN R -e "install.packages(c('optparse'), repos = 'http://cran.rstudio.com')"
RUN pip install \
    git+https://github.com/IslasGECI/descarga_datos.git@v0.1.0-beta \
    pytest
RUN pip install --upgrade --force-reinstall csvkit
RUN git clone https://github.com/IslasGECI/queries.git && \
    cd queries && \
    make install
