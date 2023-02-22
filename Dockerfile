# Add the rocker/verse Docker image for R 4.2.2

FROM rocker/verse:4.2.2

# Add our files to container

ADD data/ /home/rstudio/data/
ADD images/ /home/rstudio/images/
ADD contrast_and_scatterplots.Rmd /home/rstudio/
ADD contrast_and_scatterplots_cache/ /home/rstudio/contrast_and_scatterplots_cache/
ADD elsarticle.cls /home/rstudio/
ADD contrast-scatterplots.bib /home/rstudio/

# Add appropriate versions of required R packages to container

RUN R -e "install.packages('devtools')"

RUN R -e "require(devtools)"

RUN R -e "devtools::install_version('rticles', version = '0.24', dependencies = T)"
RUN R -e "devtools::install_version('tinytex', version = '0.44', dependencies = T)"
RUN R -e "devtools::install_version('MASS', version = '7.3-58.2', dependencies = T)"
RUN R -e "devtools::install_version('buildmer', version = '2.8', dependencies = T)"
RUN R -e "devtools::install_version('emmeans', version = '1.8.4-1', dependencies = T)"
RUN R -e "devtools::install_version('scales', version = '1.2.1', dependencies = T)"
RUN R -e "devtools::install_version('lme4', version = '1.1-31', dependencies = T)"
RUN R -e "devtools::install_version('insight', version = '0.19.0', dependencies = T)"
RUN R -e "devtools::install_version('afex', version = '1.2-1', dependencies = T)"
RUN R -e "devtools::install_version('bookdown', version = '0.32', dependencies = T)"
RUN R -e "devtools::install_version('qwraps2', version = '0.5.2', dependencies = T)"
RUN R -e "devtools::install_github('crsh/papaja')"
RUN R -e "devtools::install_version('broom.mixed', version = '0.2.9.4', dependencies = T)"
RUN R -e "devtools::install_version('kableExtra', version = '1.3.4', dependencies = T)"
RUN R -e "devtools::install_version('lmerTest', version = '3.1-3', dependencies = T)"
RUN R -e "devtools::install_version('tinylabels', version = '0.2.3', dependencies = T)"
RUN R -e "devtools::install_version('EMAtools', version = '0.1.4', dependecies = T)"
RUN R -e "devtools::install_version('ggdist', version = '3.2.1', dependecies = T)"
RUN R -e "devtools::install_version('ggpubr', version = '0.6.0', dependecies = T)"