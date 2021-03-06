# Gene Expression Variation Analysis (GEVA)

`GEVA` is a package for the analysis of differential gene expression in multiple experimental comparisons. It takes into account the fold-changes and p-values from previous differential expression (DE) results that use large-scale data (*e.g.*, microarray and RNA-seq) and evaluates which genes would react in response to the distinct experiments. This evaluation involves an unique pipeline of statistical methods, including weighted summarization, quantile detection, cluster analysis, and ANOVA tests, in order to classify a subset of relevant genes whose DE is similar or dependent to certain biological factors.

# Installation

This package can be installed from GitHub using the `BiocManager` package with the following command:

    BiocManager::install("geva")

For the complete guide, see the [inst/doc](inst/doc) directory.
