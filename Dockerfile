# Add the rocker/verse Docker image for R 4.2.2

FROM rocker/verse:4.2.2

WORKDIR /home/rstudio

# Copy renv.lock
COPY --chown=rstudio:rstudio renv.lock ./renv.lock

# Install renv and restore packages
RUN R -e "install.packages('renv')"
RUN R -e "renv::restore(prompt = FALSE)"

# Add our files to container

COPY data/ ./data/
COPY images/ ./images/
COPY contrast_and_scatterplots.Rmd ./
COPY contrast_and_scatterplots_cache/ ./contrast_and_scatterplots_cache/
COPY elsarticle.cls ./
COPY contrast-scatterplots.bib ./
COPY data_processing_for_payment.R ./
COPY anonymisation.R ./