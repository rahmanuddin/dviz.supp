#' Make combined figure of color-vision deficiency simulations
#' 
#' @param p The figure on which to perform the simulation
#' @param severity The severity of the simulation
#' @param label_x,label_y The x and y position of the labels relative to each figure
#' @param label_size The size of the labels
#' @param label_fontface The fontface of the labels
#' @param scale The scale reduction of the figures
#' @param hjust,vjust Label justification
#' @examples
#' cvd_sim(gg_color_gradient(plot_margin = margin(12, 0, 0, 0),
#'                           ymargin = 0.05) + 
#'         scale_fill_viridis_c())
#' @importFrom colorspace deutan protan tritan
#' @importFrom cowplot plot_grid
#' @importFrom colorblindr edit_colors
#' @export
cvd_sim <- function(p, severity = 1, scale = 0.9, hjust = 0, vjust = 1,
                    label_x = 0.05, label_y = 0.95, label_size = 12, label_fontface = "bold")
{
  deut <- function(c) deutan(c, severity)
  p1 <- edit_colors(p, deut)
  
  prot <- function(c) protan(c, severity)
  p2 <- edit_colors(p, prot)
  
  trit <- function(c) tritan(c, severity)
  p3 <- edit_colors(p, trit)
  
  plot_grid(p, p1, p2, p3, scale = scale, hjust = hjust, vjust = vjust,
            labels = c("original", "deutanomaly", "protanomaly", "tritanomaly"),
            label_x = label_x, label_y = label_y, label_size = label_size,
            label_fontface = label_fontface)
}