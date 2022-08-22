library(tidyverse)


Base_dir_SWMP <- "D:ARU Recordings/SWMP"


list_files <- list.files(Base_dir_SWMP, recursive = T, full.names = T, include.dirs = T) %>% 
  tibble() 

names(list_files) <- "file_path"
list_filesall <- list_files


list_files <- list_filesall %>%
  filter(grepl(".wav",file_path,fixed = TRUE)) %>%
  mutate(dir_1 = str_split_fixed(file_path,"/",n =5)[,1],
         dir_2 = str_split_fixed(file_path,"/",n =5)[,2],
         dir_3 = str_split_fixed(file_path,"/",n =5)[,3],
         dir_4 = str_split_fixed(file_path,"/",n =5)[,4],
         wav_name = str_split_fixed(file_path,"/",n =5)[,5],
         siteID = str_split_fixed(wav_name,"_", n = 2)[,1],
         date_null = str_split_fixed(wav_name, "_", n = 2)[,2],
         date = str_split_fixed(date_null, "T", n =2)[,1],
         time_null = str_split_fixed(date_null, "T", n =2)[,2],
         time = str_split_fixed(time_null, "-", n =2) [,1],
         tz_null = str_split_fixed(time_null, "-", n =2)[,2],
         tz = str_split_fixed(tz_null, "_", n =2)[,1],
         program_null = str_split_fixed(tz_null, "_", n =2)[,2],
         program = str_split_fixed(program_null, "\\[", n =2)[,1],
        location_null = str_split_fixed(program_null, "\\[", n =2)[,2],
        lat = str_split_fixed(location_null, "-", n =2)[,1],
        long_null = str_split_fixed(location_null, "-", n =2)[,2],
        long = str_split_fixed(long_null, "\\]", n =2)[,1],
        file_type = str_split_fixed(long_null, "\\]", n =2)[,2])
        
         
  
 

  





save(list_files,file = "main_wav_list.RData")

load("main_wav_list.Rdata")
