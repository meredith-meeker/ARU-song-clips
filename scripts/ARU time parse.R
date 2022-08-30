library(tidyverse)
library(tuneR)
library(lubridate)
library(dplyr)
library(tuneR)


  load("main_wav_list_wetlands_orange.RData")


wav_name <- function(d = "20220618",
                     tm = "05:17:00", # 24 hour time
                     s = "RM22699",
                     dflist = list_files_wetlands){
  
  require(lubridate)
  
  # time selected as a proper lubridate object
  
  tm_sel <- lubridate::hms(tm) # turn the true time into a character

    # vector of recording start times at that site and day
  
  tm2 <- (dflist[which(dflist[,"date"] == d & dflist[,"siteID"] == s),"time"])
  
   if(length(tm2$time) == 0){stop("No recordings for the selected date and site")}
  
  tm3 <- lubridate::hms(tm2$time) # turn the true time into a character
  

 ## We want the clip to start 5040 seconds from the beginning and last 300 seconds 

  dif_sec_all <- time_length(tm_sel - tm3)
  w_dif_sec_pos <- which(dif_sec_all > 0)
  dif_sec <- min(dif_sec_all[w_dif_sec_pos])
  w_dif_sec_sel <- which(dif_sec_all == dif_sec) 
  t = as.character(tm2[w_dif_sec_sel,"time"])
 
  ww <- which(dflist[,"date"] == d & dflist[,"time"] == t & dflist[,"siteID"] == s)

    flp = as.character(dflist[ww,"file_path"])
  return(list(flp = flp,
              dif_sec = dif_sec))
  
}#end_function

tmp <- wav_name(d = "20220618",
                s = "RM22699",
                dflist = list_files_wetlands)


tmp[["flp"]]

tmp[["dif_sec"]]

#reading the wave file length 

gsub(pattern = ":",replacement = "",x = "07:30:45")

selected_day <- "20220618"
selected_time <- "05:17:00"

#creating file writing loop

for(selected_site in dflist$siteID){
wv_sel <- wav_name(d = selected_day,
                   s = selected_site,
                   t = selected_time)

#removing colons from time

time_name <- (gsub(pattern = ":",replacement = "",x = "selected_time"))

#creating Wildtrax File name

flnm <- paste0(selected_site,"_",selected_day,"_", "time_name", ".wav")
  

#clipping wave file 

clip_tmp = readWave(filename = tmp[["flp"]],
                    from = tmp[["dif_sec"]],
                    to = tmp[["dif_sec"]] + 300,
                    units = 'seconds')

#writing new wave file and saving in folder

file_tmp = writeWave(object = clip_tmp, filename = "C:/Users/mmeek/OneDrive/Documents/Master's Thesis/Fieldwork/ARU Recordings for analysis/June 18/Sunrise/flnm", extensible = TRUE)
} #end of loop



     
        