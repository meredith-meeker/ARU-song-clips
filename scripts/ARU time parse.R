library(tidyverse)
library(tuneR)
library(lubridate)
library(dplyr)
library(tuneR)

load("main_wav_list_SWMP_orange.RData")


wav_name <- function(d = "20220618",
                     tm = "05:17:00", # 24 hour time
                     s = "RM22668",
                     dflist = list_files_wetlands){
  
  require(lubridate)
  
  # time selected as a proper lubridate oject
  
  tm <- lubridate::hms(tm) # turn the true time into a character

    # vector of recording start times at that site and day
  
  tm2 <- (dflist[which(dflist[,"date"] == d & dflist[,"siteID"] == s),"time"])
    
  tm2 <- lubridate::hms(tm2$time) # turn the true time into a character
  
  
  # identify  the number of seconds between the start time and sunrise (should remain constant)
  dif_sec_all <- time_length(tm2 - tm)
  dif_sec_neg <- dif_sec_all[dif_sec_all < 0]
  dif_sec <- max(dif_sec_neg)

 ## We want the clip to start 5040 seconds from the beginnig and last 300 seconds 
  
  ww <- which(dflist[,"date"] == d & dflist[,"time"] == t & dflist[,"siteID"] == s)

    flp = as.character(list_files_wetlands[ww,"file_path"])
  return(list(flp = flp,
              dif_sec = dif_sec))
  
}#end_function

tmp <- wav_name(d = "20220618")


tmp[["flp"]]

ss_5m <- ss_dat$Sunset$SunsetSelection |> filter(Length == "5min") |> 
  mutate(length_clip = 300,
         WildTraxName = glue::glue("{SiteID}_{yyyymmdd}_{hhmmss}"),
         SunRisSet="Sunset")