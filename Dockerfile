FROM rocker/r-base

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  build-essential \
  libcurl4-gnutls-dev \
  libxml2-dev \
  libssl-dev \
  r-cran-curl \
  r-cran-openssl \
  curl \
  gnupg1 \
  r-cran-xml2


RUN R -e 'install.packages("remotes")'
RUN R -e 'remotes::install_github("r-lib/remotes", ref = "97bbf81")'
RUN Rscript -e 'remotes::install_version("config",upgrade="never", version = "0.3")'
RUN Rscript -e 'remotes::install_version("golem",upgrade="never", version = "0.2.1")'
RUN Rscript -e 'remotes::install_version("shiny",upgrade="never", version = "1.4.0.2")'
RUN Rscript -e 'remotes::install_version("htmltools",upgrade="never", version = "0.4.0")'
RUN Rscript -e 'remotes::install_version("shinythemes",upgrade="never", version = "1.1.2")'
RUN Rscript -e 'remotes::install_version("testthat",upgrade="never", version = "2.3.2")'
RUN Rscript -e 'remotes::install_version("knitr",upgrade="never", version = "1.28")'
RUN Rscript -e 'remotes::install_version("rmarkdown",upgrade="never", version = "2.1")'
RUN mkdir /build_zone
ADD . /build_zone
WORKDIR /build_zone
RUN R -e 'remotes::install_local(upgrade="never")'
EXPOSE 80
CMD R -e "options('shiny.port'=80,shiny.host='0.0.0.0');DashboardGolem::run_app()"
