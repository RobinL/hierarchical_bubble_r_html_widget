% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hierarchical_bubble.R
\name{hierarchicalbubble-shiny}
\alias{hierarchicalbubble-shiny}
\alias{HBOutput}
\alias{renderHB}
\title{Shiny bindings for hierarchicalbubble}
\usage{
HBOutput(outputId, width = "100\%", height = "auto")

renderHB(expr, env = parent.frame(), quoted = FALSE)
}
\arguments{
\item{outputId}{output variable to read from}

\item{width, height}{Must be a valid CSS unit (like \code{'100\%'},
\code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
string and have \code{'px'} appended. \code{height} will probably not
have an effect; instead, use the \code{height} parameter in
\code{\link[timevis]{timevis}}.}

\item{expr}{An expression that generates a timevis}

\item{env}{The environment in which to evaluate \code{expr}.}

\item{quoted}{Is \code{expr} a quoted expression (with \code{quote()})? This
is useful if you want to save an expression in a variable.}
}
\description{
Output and render functions for using timevis within Shiny
applications and interactive Rmd documents.
}
