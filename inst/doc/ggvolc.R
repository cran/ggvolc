## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 7,
  fig.height = 5,
  out.width = "100%",
  dpi = 72,
  message = FALSE,
  warning = FALSE
)

## -----------------------------------------------------------------------------
library(ggvolc)

## -----------------------------------------------------------------------------
data(all_genes)
data(attention_genes)

head(all_genes)

## -----------------------------------------------------------------------------
ggvolc(all_genes)

## -----------------------------------------------------------------------------
ggvolc(all_genes, attention_genes, add_seg = TRUE)

## -----------------------------------------------------------------------------
# the 10 most significant genes overall
ggvolc(all_genes, label_top = 10, add_seg = TRUE, title = "Top 10 hits")

## -----------------------------------------------------------------------------
# the top 8 up- and top 8 down-regulated genes
ggvolc(all_genes, label_top = 8, label_dir = "each",
       add_seg = TRUE, title = "Top 8 up + 8 down")

## -----------------------------------------------------------------------------
ggvolc(all_genes, sig_col = "pvalue", add_seg = TRUE,
       title = "Significance on the raw p-value")

## -----------------------------------------------------------------------------
ggvolc(all_genes, attention_genes, size_var = "log2FoldChange", add_seg = TRUE)

## ----fig.height = 7-----------------------------------------------------------
p <- ggvolc(all_genes, attention_genes, add_seg = TRUE)
genes_table(p, attention_genes)

## ----fig.height = 7-----------------------------------------------------------
p_top <- ggvolc(all_genes, label_top = 10, add_seg = TRUE)
genes_table(p_top, all_genes, top_n = 10)

## -----------------------------------------------------------------------------
data(edger_genes)
head(edger_genes, 3)

ggvolc(edger_genes, label_top = 8, add_seg = TRUE, title = "edgeR input")

## -----------------------------------------------------------------------------
ggvolc_palettes()

ggvolc(all_genes, label_top = 8, label_dir = "each", palette = "okabe_ito")

## -----------------------------------------------------------------------------
# number of up- and downregulated genes in the corners
ggvolc(all_genes, show_counts = TRUE)

# color named gene sets
ribosomal  <- grep("^RP[LS][0-9]", all_genes$genes, value = TRUE)
heat_shock <- grep("^HSP[0-9]|^SSA[0-9]", all_genes$genes, value = TRUE)
ggvolc(all_genes, highlight = list(Ribosomal = ribosomal, `Heat shock` = heat_shock))

## ----fig.width = 10, fig.height = 4.5-----------------------------------------
ggvolc(stress_timecourse, label_top = 5, show_counts = TRUE)

## ----fig.width = 10, fig.height = 4.5-----------------------------------------
ggvolc(stress_timecourse, label_top = 5, show_counts = TRUE, flip = TRUE)

## -----------------------------------------------------------------------------
ggvolc(all_genes, palette = c(down = "navy", up = "firebrick"))

## ----include = FALSE----------------------------------------------------------
# The live widget embeds every point plus its JavaScript, which makes the
# vignette far too large for CRAN; it is rendered on the package website only.
live_widget <- identical(Sys.getenv("IN_PKGDOWN"), "true") &&
  requireNamespace("ggiraph", quietly = TRUE)

## ----eval = live_widget-------------------------------------------------------
# ggvolc(all_genes, attention_genes, interactive = TRUE)

## ----eval = !live_widget, echo = FALSE, results = "asis"----------------------
cat("```r\nggvolc(all_genes, attention_genes, interactive = TRUE)\n```\n\n",
    "_See the live, hover-to-inspect version on the ",
    "[package website](https://loukesio.github.io/ggvolc/articles/ggvolc.html)._",
    sep = "")

