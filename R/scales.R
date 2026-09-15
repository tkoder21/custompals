#' ggplot2 color/fill scales using a custom palette
#'
#' Drop-in replacements for `ggplot2::scale_color_*`/`scale_fill_*` backed
#' by [pal()]. Requires the ggplot2 package.
#'
#' @param name Name of the palette. See [list_palettes()] for options.
#' @param discrete Whether the scale is discrete (`TRUE`) or continuous
#'   (`FALSE`).
#' @param ... Passed on to the underlying ggplot2 scale function.
#'
#' @return A ggplot2 scale object.
#' @export
#' @examples
#' if (requireNamespace("ggplot2", quietly = TRUE)) {
#'   ggplot2::ggplot(mtcars, ggplot2::aes(mpg, wt, color = factor(cyl))) +
#'     ggplot2::geom_point() +
#'     scale_color_custompal("sunset")
#' }
scale_color_custompal <- function(name, discrete = TRUE, ...) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("Package 'ggplot2' is required for this function.", call. = FALSE)
  }

  if (discrete) {
    ggplot2::discrete_scale(
      aesthetics = "colour",
      palette = function(n) as.vector(pal(name, n)),
      ...
    )
  } else {
    ggplot2::scale_color_gradientn(
      colours = as.vector(pal(name, type = "continuous", n = 256)),
      ...
    )
  }
}

#' @rdname scale_color_custompal
#' @export
scale_fill_custompal <- function(name, discrete = TRUE, ...) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("Package 'ggplot2' is required for this function.", call. = FALSE)
  }

  if (discrete) {
    ggplot2::discrete_scale(
      aesthetics = "fill",
      palette = function(n) as.vector(pal(name, n)),
      ...
    )
  } else {
    ggplot2::scale_fill_gradientn(
      colours = as.vector(pal(name, type = "continuous", n = 256)),
      ...
    )
  }
}

#' @rdname scale_color_custompal
#' @export
scale_colour_custompal <- scale_color_custompal
