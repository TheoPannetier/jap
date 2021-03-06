% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ssh_functions.R
\name{run_on_cluster}
\alias{run_on_cluster}
\title{Run a function on cluster}
\usage{
run_on_cluster(
  github_name = NA,
  package_name,
  function_name,
  fun_arguments,
  cluster_folder = "home",
  account = jap::your_account(),
  session = NA
)
}
\arguments{
\item{account}{a peregrine account}

\item{session}{a ssh session}
}
\value{
nothing
}
\description{
Run a function on cluster
}
\author{
Giovanni Laudanno
}
