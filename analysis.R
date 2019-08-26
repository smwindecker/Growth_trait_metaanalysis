
# Packages --------------------
library(bibtex)
library(metafor)
library(grid)
library(gridExtra)
library(lme4)
library(ggplot2)
library(downloader)
library(knitr)
library(tinytex)

# Source function scripts -----------
source("R/data_processing.R")
source("R/figures.R")
source("R/model.R")
source("R/plots.R")
source("R/utils.R")

dir.create("output", FALSE, TRUE)
dir.create("downloads", FALSE, TRUE)

# Data downloads -------------------
download_baad("downloads/baad.rds")

# Data processing ----------
paper_bib <- read.bib("references/paper.bib")
meta_bib <- read.bib("references/metaanalyses.bib")
combined_bib <- merge_bib_files(meta_bib, paper_bib)
write.bib(combined_bib, file = "ms/refs-main.bib")

read_bib <- read.bib("references/read.bib")
suppmat_bib <- merge_bib_files(combined_bib, read_bib)
write.bib(suppmat_bib, file = "ms/refs-suppmat.bib")

AllData <- clean_raw_data("data/CompileData.csv")
CleanData <- standardise_data(AllData)
CompleteData <- build_complete_data(CleanData)
CompleteData_inter <- Build_intersp_complete_data(CleanData)
IdealData <- build_ideal_data(CompleteData)
CoordTable <- build_map_data(CleanData)
IdealData_rgr <- subset_growth(IdealData, "RGR")
IdealData_agr <- subset_growth(IdealData, "AbGR")
CompleteData_rgr <- subset_growth(CompleteData_inter, "RGR")

GCi <- list_by_trait(CompleteData_inter)
GIi <- list_by_trait(IdealData)
GIrgr <- list_by_trait(IdealData_rgr)
GIagr <- list_by_trait(IdealData_agr)
GCrgr <- list_by_trait(CompleteData_rgr)
Snapshot <- snapshot_websci("data/ref.traits/WebSci_all.csv")

RCi1 <- EffectSizeSum(CompleteData_rgr)
RCi <- list_by_trait(RCi1)
RIi1 <- EffectSizeSum(IdealData_rgr)
RIi <- list_by_trait(RIi1)

baad <- readRDS("downloads/baad.rds")

# Figures --------------------
pdf("output/Fig1.pdf", height = 3L, width = 4L)
figure_1(CleanData)
dev.off()

pdf("output/Fig2.pdf", height = 9L, width = 4L)
figure_2(CompleteData_inter)
dev.off()

pdf("output/Fig3.pdf", height = 5L, width = 4L)
figure_3(GIrgr, GCrgr)
dev.off()

pdf("output/Fig4.pdf", height = 5L, width = 4L)
figure_4(GCi)
dev.off()

pdf("output/FigA1.pdf", height = 3L, width = 9L)
figure_A1(baad)
dev.off()

pdf("output/FigA2.pdf", height = 3L, width = 6L)
figure_A2(CoordTable)
dev.off()

pdf("output/FigA3.pdf", height = 6L, width = 6L)
figure_A3(GCi)
dev.off()

pdf("output/FigA4.pdf", height = 6L, width = 5L)
figure_A4(GIi, GIrgr, GIagr)
dev.off()

pdf("output/FigA5.pdf", height = 6L, width = 5L)
figure_A5(RIi, RCi)
dev.off()

pdf("output/FigA6a.pdf")
figure_A6(GCi, "SLA", "WD", c("a", "b"))
dev.off()

pdf("output/FigA6b.pdf")
figure_A6(GCi, "Aarea", "Seedmass", c("c", "d"))
dev.off()

pdf("output/FigA6c.pdf")
figure_A6.2(GCi, "Hmax", "e")
dev.off()

pdf("output/FigA7.pdf")
figure_A7(GCi)
dev.off()

pdf("output/FigA8.pdf")
figure_A8(GCi)
dev.off()

pdf("output/FigA9.pdf")
figure_A9(GCi)
dev.off()

pdf("output/GraphicalAbstract.pdf", height = 3L, width = 4L)
figure_graphical_abstract(GIi, GIrgr, GIagr)
dev.off()

# Documents ---------------
knit("ms/ms-suppinfo.Rnw", output = "ms/ms-suppinfo.tex")
pdflatex("ms/ms-suppinfo.tex")
pdflatex("ms/ms.tex")

