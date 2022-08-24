library(tidyverse)
library(tuneR)


load("main_wav_list_SWMP_orange.RData")


wav_name <- function(d = "20220617",
                     tm = "07:00", # 24 hour time
                     s = "RM22699",
                     dflist = list_files_wetlands){
  
  require(lubridate)
  
  # time selected as a proper lubridate oject
  t = paste()# turn the true time into a character
  
  
  # vector of recording start times at that site and day
  start_times <- list_files_wetlands[which(dflist[,"date"] == d & dflist[,"siteID"] == s),"time"]
  
  # identify which of the start times contains the selected time
  
  
  # identify  the number of seconds between the start time and the selected time
  dif_sec <- 
    
  ww <- which(dflist[,"date"] == d & dflist[,"time"] == t & dflist[,"siteID"] == s)

    flp = as.character(list_files_wetlands[ww,"file_path"])
  return(list(flp = flp,
              dif_sec = dif_sec))
  
}#end_function

tmp <- wav_name(d = "20220618")


tmp[["flp"]]
