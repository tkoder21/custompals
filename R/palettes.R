#' List available palette names
#'
#' @return A character vector of palette names.
#' @export
#' @examples
#' list_palettes()
list_palettes <- function() {
  names(palettes)
}

#' Get a custom color palette
#'
#' Retrieves a named palette as a character vector of hex codes. Palettes
#' can be returned at their original length (discrete), truncated/expanded
#' to a specific number of discrete colors, or interpolated to any number
#' of colors (continuous).
#'
#' @param name Name of the palette. See [list_palettes()] for options.
#' @param n Number of colors to return. Defaults to the palette's full
#'   length. Ignored if greater than the palette length when
#'   `type = "discrete"`.
#' @param type Either `"discrete"` (subset of the original colors) or
#'   `"continuous"` (colors interpolated with [grDevices::colorRampPalette()]).
#'
#' @return An object of class `"palette"`, printable as a color swatch.
#' @export
#' @examples
#' pal("sunset")
#' pal("sunset", n = 2)
#' pal("ocean", n = 20, type = "continuous")
pal <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)

  if (!name %in% names(palettes)) {
    stop(
      "Palette '", name, "' not found. Available palettes: ",
      paste(names(palettes), collapse = ", "),
      call. = FALSE
    )
  }

  this_pal <- palettes[[name]]

  if (missing(n)) {
    n <- length(this_pal)
  }

  if (type == "discrete" && n > length(this_pal)) {
    stop(
      "Palette '", name, "' only has ", length(this_pal), " colors. ",
      "Request fewer colors, or use type = \"continuous\" to interpolate.",
      call. = FALSE
    )
  }

  out <- switch(
    type,
    discrete = this_pal[seq_len(n)],
    continuous = grDevices::colorRampPalette(this_pal)(n)
  )

  structure(out, class = "palette", name = name)
}

#' @export
print.palette <- function(x, ...) {
  n <- length(x)
  old_par <- graphics::par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(graphics::par(old_par))

  graphics::image(
    seq_len(n), 1, as.matrix(seq_len(n)),
    col = as.vector(x), xlab = "", ylab = "",
    xaxt = "n", yaxt = "n", bty = "n"
  )
  graphics::rect(0, 0.9, n + 1, 1.1, col = grDevices::rgb(1, 1, 1, 0.8), border = NA)
  graphics::text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1.5)

  invisible(x)
}
