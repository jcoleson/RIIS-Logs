read.IISLog <- function(filePath, tz="America/Chicago") {
  # Reads the contents of an IIS logs file and returns a dataframe.
  # Args:
  #   filePath: full file path to the IIS log file
  #   tz: Name of your local time zone if you want to convert time to local
  # 
  # Returns:
  #   dataframe with the log file data 
  
  # read just the 3rd line to determine the column names
  columnNames = read.table(filePath, header = FALSE, sep = " ", skip = 3, nrows = 1, comment.char = "")
  
  # remove first column name '#Fields:' because it's not a real column. Just a label. 
  columnNames[,1] <- NULL 
  
  # read the actual log file
  iisLogFile = read.csv(filePath, header = FALSE,sep=' ',comment.char="#",blank.lines.skip=TRUE, quote = "")
  colnames(iisLogFile) = gsub("-","_",unlist(columnNames[1,])) #replace - with _ in column names
  
  # create local_datetime column that combines date and time and swithc UTC to local (central) time
  iisLogFile$local_datetime = as.POSIXct(paste(iisLogFile$date,iisLogFile$time, sep=" "), tz="UTC") 
  iisLogFile$date=as.Date(iisLogFile$date)
  attributes(iisLogFile$local_datetime)$tzone =  tz
  
  if ("time_taken" %in% colnames(iisLogFile)) {
    iisLogFile$time_taken_s <-  iisLogFile$"time_taken" / 1000
    iisLogFile$datetimeStarted <- iisLogFile$local_datetime - iisLogFile$time_taken_s
    iisLogFile$datetimeEnded <- iisLogFile$local_datetime
  }
  
  if ("sc_bytes" %in% colnames(iisLogFile)) {
    iisLogFile$Kbytes <- round((iisLogFile$sc_bytes / 1024), digits = 2 )  
    iisLogFile$Mbytes <- round(((iisLogFile$sc_bytes / 1024) / 1024), digits = 2 )
  }
  
  return(iisLogFile)
}