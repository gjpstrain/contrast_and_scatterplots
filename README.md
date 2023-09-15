# The Effects of Contrast on the Perception of Correlation in Scatterplots

Files, data, and scripts required to fully recreate two experiments investigating how manipulating point contrast in scatterplots can influence viewers' performance in a correlation estimation task.

## Data

Raw data (.csv format) is located in the `data` folder. The R script `data_processing_for_payment.R` takes raw data straight from pavlovia.org, and writes a .csv file with a list of passed and failed participants to the `data` folder.

Once participants have been paid or excluded, use the `anonymisation.R` script to remove identifiable prolific IDs.

### Analysis Within a Fully-Reproducible Computational Environment

Resources are provided for the full reproduction of the computational environment (R, Rstudio, and package versions) that was used for data wrangling, visualization, statistical modelling, and reporting.

To begin, clone this repository to your local machine. With Docker running in the background, use a terminal (or cmd on Windows) to navigate to the cloned repository and type the following Docker command:

```docker build -t contrast_and_scatterplots .```

Then, type:

```docker run --rm -p 8787:8787 -e PASSWORD=password contrast_and_scatterplots```

Once the container is running, open a web browser and type `localhost:8787` in the address bar. Enter the username `rstudio` and the password `password`. This will generate a fully functioning Rstudio session running from the docker container.

### Re-creating the manuscript

Opening `contrast_and_scatterplots.Rmd` and using the 'Knit' button (or shift+k) will allow you to re-create a .pdf of the manuscript.

IMPORTANT: Models have been cached to increase performance. The cache will not be recognised automatically when using RStudio within the Docker container. eval_models must be set to FALSE in line 100 in order to use the cached models. This will prevent knitr from executing the code for each model, but will 'lazyload' all cached models so they can be used in manuscript generation. Setting eval_models to TRUE in line 100 will result in all models being re-generated.

The manuscript was written using a template from the `rticles` package.

Files used in generating manuscript:

 - `contrast_and_scatterplots.Rmd`: Full R markdown script including text and all code
 - `contrast_and_scatterplots_cache`: folder containing cached models
 - `data`: folder containing collected, anonymised data
 - `images` and `contrast_and_scatterplots_files` folders for manuscript figures
 - `contrast-scatterplots.bib` for referencing
 - `elsarticle.cls`: LaTeX class file required for building manuscript

Knitting the manuscript may take some time depending on the performance of your computer.

### Other Files

 - `item_preparation`: folder containing scripts to generate all experimental items, practice items, and visual masks for each experiment

## Experiment Code and Materials

 - Experiment 1: https://gitlab.pavlovia.org/Strain/exp_uniform_adjustments
 - Experiment 2: https://gitlab.pavlovia.org/Strain/exp_spatially_dependent
 
## Pre-Registrations

Pre-registrations for hypotheses with the OSF can be found here: https://osf.io/v23e9/
