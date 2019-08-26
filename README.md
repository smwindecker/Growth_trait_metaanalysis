Plant species traits and growth rates meta-analysis
--------

This repository contains all the code used in the manuscript:

* Title: "On the link between functional traits and growth rate: meta-analysis shows effects change with plant size, as predicted"
* Authors: Anais Gibert, Emma F. Gray, Mark Westoby,  Ian J. Wright, and Daniel S. Falster,
* Year of publication: published
* Journal: Journal of Ecology
* doi: 10.1111/1365-2745.12594

Synopsis of the study
--------
The literature is inconsistent about empirical correlations between functional traits and plant growth rate (GR), casting doubt on the capacity of traits to predict growth.
Traits should influence growth in a size-dependent manner. We outline mechanisms and hypotheses based on new theory, and test these predictions for five traits using a meta-analysis of 108 studies (> 500 correlations).
Results were consistent with predictions. Specific leaf area was correlated with GR in small but not large plants. Correlations of GR with wood density and assimilation rate were not affected by size. Maximum height and seed mass were correlated with GR only in one plant size category.
We show that correlations between traits and GR change in a predictable way as a function of plant size. Our understanding of plant strategies should shift away from attributing slow vs fast growth to species throughout life, in favour of attributing growth trajectories.

Running the code
--------

All analyses were done in `R`. To reproduce this paper, run the code contained in the `analysis.R` file. Figures will be output to a directory called `output`. Also saved in this file is a homogenized dataset, containing the data used in the analyses and included as supplementary material with the paper.

If reproducing these results on your own machine, you must first install the required packages, listed under `Depends` in the `DESCRIPTION` file. 

Alternatively, you can use an interactive RStudio session to run the `analysis.R` file with the required software pre-installed. This session is hosted by binder and can be accessed by clicking on the following:

[![Launch Rstudio Binder](http://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/dfalster/Growth_trait_metaanalysis/master?urlpath=rstudio)

List of files available and explanation
--------

- `data/CompileData.csv` raw data, needed to run the analyses
- `data/CompileData_meta.csv` definition of columns in `data/ComplieData.csv`
- `R` directory containing functions used in analysis
- `analysis.R` main script to run the analyses and generate all the figures and tables.
- `ms` directory containing manuscript in LaTeX and accompanying style files 
- `references/complete.bib` bibtex file with all references used in the meta-analyses and in the manuscript
- `references/meta-analyses.bib` bibtex file with all references used in the meta-analyses
- `references/read.bib` bibtex file with all references red to do the meta-analyses (all the studies used + studies red but discard from our meta-analyses)

Contributors
------------------------
Daniel Falster
Anais Gibert
