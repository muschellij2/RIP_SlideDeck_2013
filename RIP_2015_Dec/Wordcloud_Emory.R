############
#
############
rm(list=ls())

library(rscopus)
library(ggplot2)
library(tidyr)
library(reshape2)
library(googleCite)
library(dplyr)
library(lubridate)
library(stringr)

uname = Sys.info()[['user']]

wd = switch(uname,
    jmuschel = "~/",
    johnmuschelli ="~/Dropbox/CTR/DHanley/CT_Registration/RIP_SlideDeck/RIP_2015_Dec/"
    )
setwd(wd)
# query_string = "affil(emory)"
# rollins 60025315
outfile = "lw_SCOPUS.rda"
if (!file.exists(outfile)) {

    lw = author_data(last_name = "Waller",
        first_name = "Lance", 
        all_author_info = TRUE)

    save(lw, file = outfile)
} else {
    xx = load(outfile)
}

outfile = "Emory_SCOPUS.rda"
if (!file.exists(outfile)) {
    rollins_sph = "60025315"
    emory_data = affil_data(
        affil_id = rollins_sph)
} else {
    xx = load(outfile)
}

entries = emory_data$entries
df = emory_data$df


############################
# Google Citation
############################


outfile = "lance_waller.rda"
if (!file.exists(outfile)) {
    alldata = searchCite(
        Author = "Lance Waller")
} else {
    xx = load(outfile)
}

auth_pat = attr(lw, "auth_pat")
splitter = attr(lw, "splitter")


# par(mfrow = c(1, 2))
# makeAuthorCloud(alldata, splitter, auth_pat)
# makePaperCloud(alldata)

nc = ncol(lw)
ind = which(colnames(lw) == "Year")
grab = colnames(lw)[seq(ind+1, nc)]
cites = lw[, c("Title", "Citations", 
    grab)]
cites$Citations = as.numeric(cites$Citations)

cites = arrange(cites, desc(Citations))
n = 5
top_n = head(cites, 5)
top_n = top_n[, c("Title", "Citations"), 
drop = FALSE]

long = gather(cites, 
    key = year, 
    value = citations,
    -Title, -Citations)
long = filter(long, !is.na(citations))
long = filter(long, citations > 0)

long$group = factor(
    as.numeric(factor(long$Title))
    )
long = arrange(long, year, group)
long$year = as.numeric(long$year)
long$citations = as.numeric(long$citations)
long$Citations = as.numeric(long$Citations)

long = long %>%
    group_by(group) %>%
    mutate(sum_cit = cumsum(citations))  %>%
    as.data.frame

g = ggplot(aes(x = year, 
    colour = group), 
    data = long) + geom_line() + 
    guides(colour = FALSE)
gcit = g + aes(y = citations)

gcum = g + aes(y = sum_cit)

top_n = merge(top_n, 
    unique(long[, c("Title", "group")]), 
    all.x = TRUE, 
    sort = FALSE)
top_n$year = year(Sys.Date())


top_n$plot_title = str_wrap(top_n$Title, 
    width = 50)

long_top = long %>%
    filter(Title %in% top_n$Title ) %>%
    as.data.frame

gtop = gcum + geom_text(
    aes(label = plot_title,
    x = year - 10, y = Citations), 
    data = top_n) 
gtop

(gcum %+% long_top) + geom_text(
    aes(label = plot_title,
    x = year - 10, y = Citations), 
data = top_n) 



