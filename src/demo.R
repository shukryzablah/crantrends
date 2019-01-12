#'---
#'title: "CRAN Trends: Exploring Options"
#'author: "Shukry Zablah"
#'date: "December 25, 2018"
#'output: pdf_document
#'---

#'## Setup

#+ imports
library(dplyr)
library(ggplot2)
library(cranlogs)
library(adjustedcranlogs)

#'We will be using the `cranlogs` package for our queries, and `ggplot2` for our graphics.
#' 
#'## Usage: Cranlogs

#+ usage
Downloads <- cran_downloads(packages = c("dplyr", "data.table"),
               when = "last-month")

#+ table
glimpse(Downloads)

#+ viz
ggplot(data = Downloads, aes(x = date, y = count, color = package)) +
    geom_line() +
    labs(x = "Date", y = "Download count",
         title = "data.table vs dplyr cran downloads last month",
         caption = "Data from cranlogs package")

#'## Commentary
#'
#'* The existence of the package makes it simple for us to make queries. The prototype can be built on shiny, but I know that there is also a json api, which depending on how things go, would mean building a small webapp without an R backend.
#'
#'* We are considering including the following functionality (as in this would be ideal, we recognize that some of this will not be possible to implement.):
#' * package search
#' * related packages
#' * search history
#' * top packages
#' * trending packages
#' * inclusion of github downloads
#' 
#'* Another point to consider is the usage of the adjustedcranlogs package, that presumably fixes some of the download counts related to package updates.
#'
#'## Usage: Adjusted Cranlogs

#+ usage2
Downloads <- adj_cran_downloads(packages = c("dplyr", "data.table"),
               when = "last-month")

#+ table2
glimpse(Downloads)

#+ viz2
ggplot(data = Downloads, aes(x = date, y = count, color = package)) +
    geom_line() +
    labs(x = "Date", y = "Download count",
         title = "data.table vs dplyr cran downloads last month",
         caption = "Data from adjustedcranlogs package")

