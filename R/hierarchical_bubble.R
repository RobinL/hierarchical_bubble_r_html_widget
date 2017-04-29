#' @export
hierarchical_bubble <- function(data = list(), width = NULL, height = NULL, elementId = NULL) {

  # create widget
  htmlwidgets::createWidget(
    name = 'hierarchicalbubble', #should match the base name of the YAML and js files used to implement the widget in inst/htmlwidgets
    data,
    width = width,
    height = height,
    package = 'hierarchicalbubble',
    elementId = elementId,
    htmlwidgets::sizingPolicy(viewer.suppress = TRUE,
                              knitr.figure = FALSE,
                              browser.fill = TRUE,
                              browser.padding = 75,
                              knitr.defaultWidth = 800,
                              knitr.defaultHeight = 500)
  )
}

#' Shiny bindings for hierarchicalbubble
#'
#' Output and render functions for using timevis within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended. \code{height} will probably not
#'   have an effect; instead, use the \code{height} parameter in
#'   \code{\link[timevis]{timevis}}.
#' @param expr An expression that generates a timevis
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name hierarchicalbubble-shiny
#' @export
HBOutput <- function(outputId, width = '100%', height = 'auto') {
  htmlwidgets::shinyWidgetOutput(outputId, 'hierarchicalbubble', width, height, package = 'hierarchicalbubble')
}

#' @rdname hierarchicalbubble-shiny
#' @export
renderHB <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, HBOutput, env, quoted = TRUE)
}

