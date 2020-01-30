repos <- structure(c(CRAN="https://cran.wu.ac.at"))
options(repos=repos, mc.cores=2L, Ncpus=2L, menu.graphics=FALSE)
rm(repos)

invisible(Sys.setenv(LANGUAGE="en"))
invisible(Sys.setlocale("LC_MESSAGES", "en_US.UTF-8"))

if(interactive()) {
    if (grepl("unstable", version$version.string)) {
        options(prompt="Rdevel> ")
    }
    la <- function()devtools::load_all()
}
