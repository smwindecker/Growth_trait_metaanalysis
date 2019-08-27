Plant species traits and growth rates meta-analysis
--------

This repository contains all the code used in the manuscript:

* Title: "On the link between functional traits and growth rate: meta-analysis shows effects change with plant size, as predicted"
* Authors: Anais Gibert, Emma F. Gray, Mark Westoby,  Ian J. Wright, and Daniel S. Falster,
* Year of publication: published
* Journal: Journal of Ecology
* doi: 10.1111/1365-2745.12594

## Synopsis of the study

The literature is inconsistent about empirical correlations between functional traits and plant growth rate (GR), casting doubt on the capacity of traits to predict growth.
Traits should influence growth in a size-dependent manner. We outline mechanisms and hypotheses based on new theory, and test these predictions for five traits using a meta-analysis of 108 studies (> 500 correlations).
Results were consistent with predictions. Specific leaf area was correlated with GR in small but not large plants. Correlations of GR with wood density and assimilation rate were not affected by size. Maximum height and seed mass were correlated with GR only in one plant size category.
We show that correlations between traits and GR change in a predictable way as a function of plant size. Our understanding of plant strategies should shift away from attributing slow vs fast growth to species throughout life, in favour of attributing growth trajectories.

## List of files available and explanation

This repository contains all the code and data needed to rerun the analyses presented. A copy of the data has also been archived in Datadryad at [doi:10.5061/dryad.701q8](https://datadryad.org/resource/doi:10.5061/dryad.701q8). 

Files included in the repository here include:

- `data/`: Raw data
	- `CompileData.csv`: raw data, needed to run the analyses
	- `CompileData_meta.csv`: definition of columns in `data/ComplieData.csv`
- `R` directory containing functions used in analysis
- `ms` directory containing manuscript in LaTeX and accompanying style files 
- `references/`: bibtex files with references
		- `complete.bib`: references used in the meta-analyses and in the manuscript
	- `meta-analyses.bib`: references used in the meta-analyses
	- `read.bib`: all references read to do the meta-analyses (all the studies used + studies read but discarded from our meta-analyses)

Additional accessory files are also including:

- `DECRIPTION`: A machine-readable [compendium]() file containing key metadata and dependencies 
- `LICENSE`: License for the materials
- `Dockerfile` & `.binder/Dockerfile`: files used to generate docker containers for long-term reproducibility

## Running the code

All analyses were done in `R`, and the paper is written in LaTeX. All code needed to reproduce the submitted products is included in this repository. To reproduce this paper, run the code contained in the `analysis.R` file. Figures will be output to a directory called `output` and the paper and supplementary materials in the folder `ms`.


The paper was written in 2016 using a version of R available at the time. With some minor updates, the code has been updated and was last seen running wild and free on R 3.6.1. You can try running it on your current version and it may work. 

To ensure [computational reproducibility](https://www.britishecologicalsociety.org/wp-content/uploads/2017/12/guide-to-reproducible-code.pdf) into the future, we have also generated [Docker](http://dockerhub.com) and [Binder](https://mybinder.org) containers, enabling you to launch a compute environment built off R 3.6.1 with all the dependencies included.

### Running locally

If reproducing these results on your own machine, first download the code and then install the required packages, listed under `Depends` in the `DESCRIPTION` file. This can be achieved by opening the Rstudio project and running:

```{r}
#install.packages("devtools")
devtools::install_deps()
```

Then run `analysis.R`. 

### Running on Binder 

You can launch the analysis on the web in an interactive RStudio session with the required software pre-installed. This session is hosted by binder and can be accessed by clicking on the following:

[![Launch Rstudio Binder](http://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/traitecoevo/Growth_trait_metaanalysis/master?urlpath=rstudio)

## Running via Docker

If you have Docker installed, you can recreate the compute environment as follows. 

First fetch the container:

```
docker pull traitecoevo/growth_trait_metaanalysis
```

Then launch it via:

```
docker run -d -v $(pwd):/home/rstudio/ -p 127.0.0.1:8787:8787 \
-e DISABLE_AUTH=true traitecoevo/growth_trait_metaanalysis
```

The code above runs an rstudio session, which is accessed by pointing your browser to [localhost:8787](localhost:8787). For more info see instructions from [rocker](https://hub.docker.com/r/rocker/rstudio).

## Building the docker images (optional)

For posterity, the docker image was built off [`rocker/verse:3.6.1` container](https://hub.docker.com/r/rocker/verse) via

```
docker build -t traitecoevo/growth_trait_metaanalysis .
```
and was then pushed to dockerhub ([here](https://cloud.docker.com/u/traitecoevo/repository/docker/traitecoevo/growth_trait_metaanalysis)). The image used by binder builds off this container, adding extra features needed bi binder, as described in [rocker/binder](https://hub.docker.com/r/rocker/binder/dockerfile).


Contributors
------------------------
Daniel Falster
Anais Gibert
Saras Windecker (help with binder and reproducibility)
