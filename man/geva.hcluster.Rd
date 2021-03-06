% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hclustering.R
\docType{data}
\name{geva.hcluster}
\alias{geva.hcluster}
\alias{options.hc.metric}
\alias{options.hc.method}
\title{GEVA Hierarchical Clustering}

\usage{
geva.hcluster(
  sv,
  resolution = 0.3,
  hc.method = options.hc.method,
  hc.metric = options.hc.metric,
  cl.score.method = options.cl.score.method,
  ...,
  include.raw.results = FALSE
)

options.hc.metric
# c("euclidean", "maximum", "manhattan", "canberra", 
#   "binary", "minkowski")

options.hc.method
# c("centroid", "median", "ward", "single")
}
\arguments{
\item{sv}{a \code{numeric} \code{\linkS4class{SVTable}} object (usually \code{\linkS4class{GEVASummary}})}

\item{resolution}{\code{numeric} (\code{0} to \code{1}), used as a "zoom" parameter for cluster detection. A zero value returns the minimum number of clusters that can detected, while \code{1} returns the maximum amount of detectable clusters}

\item{hc.method}{\code{character}, the agglomeration method to be used. Used as the \code{method} argument for \code{\link[fastcluster:hclust.vector]{fastcluster::hclust.vector()}}}

\item{hc.metric}{\code{character}, the distance measure to be used. Used as the \code{metric} argument for \code{\link[fastcluster:hclust.vector]{fastcluster::hclust.vector()}}}

\item{cl.score.method}{\code{character}, method used to calculate the cluster scores for each point. If \code{"auto"}, the \code{"hclust.height"} method is selected}

\item{...}{additional arguments:
\itemize{
\item{\code{mink.p} : \code{numeric}, parameter for the Minkowsky metric. Used as the \code{p} argument for \code{\link[fastcluster:hclust.vector]{fastcluster::hclust.vector()}}}
\item{\code{verbose} : \code{logical}, whether to print the current progress (default is \code{TRUE})}
}}

\item{include.raw.results}{\code{logical}, whether to attach intermediate results to the returned object}
}
\value{
A \code{\linkS4class{GEVACluster}} object
}
\description{
Performs a hierarchical cluster analysis from summarized data.
}
\details{
This function performs a hierarchical cluster analysis with the aid of implemented methods from the \code{\link[fastcluster:fastcluster]{fastcluster::fastcluster}} package, particularly the \code{\link[fastcluster:hclust.vector]{fastcluster::hclust.vector()}} function. The available methods for the \code{hc.method} and \code{hc.metric} are described in the function's documentation page (see \code{\link[fastcluster:hclust.vector]{fastcluster::hclust.vector()}}).

The \code{resolution} value is an accessible way to define the cluster separation threshold used in hierarchical clustering. The algorithm produces a dendrogram-like hierarchy in which each level/node is separated by a distance (sometimes called "height") to the next level/node, and the \code{resolution} translates a value between \code{0} and \code{1} to a propotional value within the total hierarchy height. This allows defining the rate of clusters from \code{0} to \code{1}, which results in the least number of possible clusters (usually two) for \code{0}, and the highest number (approximately one cluster per point) for \code{1}.

If \code{include.raw.results} is \code{TRUE}, some aditional data will be attached to the \code{info} slot of the returned \code{GEVACluster} objects, including the \emph{kNN} tree generated during the intermediate steps.
}
\note{
In hierarchical clustering, all points are clustered. Therefore, setting \code{resolution} to \code{1} will result into one cluster per point, where the cluster analysis may become pointless (no pun intended).
}
\examples{
## Hierarchical clustering from a randomly generated input 

# Preparing the data
ginput <- geva.ideal.example()      # Generates a random input example
gsummary <- geva.summarize(ginput)  # Summarizes with the default parameters

# Hierarchical clustering
gclust <- geva.hcluster(gsummary)
plot(gclust)

# Hierarchical clustering with slightly more resolution
gclust <- geva.hcluster(gsummary,
                       resolution=0.35)
plot(gclust)

}
\seealso{
Other geva.cluster: 
\code{\link{geva.cluster}()},
\code{\link{geva.dcluster}()},
\code{\link{geva.quantiles}()}
}
\concept{geva.cluster}
\keyword{datasets}
