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
  colnames(iisLogFile) = gsub("-|\\(|\\)","_",unlist(columnNames[1,])) #replace - with _ in column names

  # Ensure necessary columns exist before processing
  if (all(c("date", "time") %in% colnames(iisLogFile))) {
    # create local_datetime column that combines date and time and switch UTC to local (central) time
    iisLogFile$local_datetime <- safe_as_POSIXct(paste(iisLogFile$date, iisLogFile$time, sep=" "))
    iisLogFile$date=safe_as_Date(iisLogFile$date)
    attributes(iisLogFile$local_datetime)$tzone <- tz
    
    if ("time_taken" %in% colnames(iisLogFile)) {
      iisLogFile$time_taken_s <-  iisLogFile$"time_taken" / 1000
      iisLogFile$datetimeStarted <- iisLogFile$local_datetime - iisLogFile$time_taken_s
      iisLogFile$datetimeEnded <- iisLogFile$local_datetime
    }
  
  }

  if ("sc_bytes" %in% colnames(iisLogFile)) {
      iisLogFile$Kbytes <- round((iisLogFile$sc_bytes / 1024), digits = 2 )  
      iisLogFile$Mbytes <- round(((iisLogFile$sc_bytes / 1024) / 1024), digits = 2 )
    }
  
  return(iisLogFile)
}

safe_as_POSIXct <- function(x, pTz = "UTC") {
  tryCatch(as.POSIXct(x, tz = pTz), error = function(e) NA)
}
safe_as_Date <- function(x) {
  tryCatch(as.Date(x), error = function(e) NA)
}
