IIS.FilterBy.Date <- function(iisLogData, startDateTime, endDateTime, localtz="America/Chicago") {
  # Filters out any data not from the client ip address.
  # Args:
  #   iisLogData: dataframe with iis log data
  #   startDateTime: Earliest date/time to inlcude 
  #   endDateTime: Latest date/time to inlcude 
  # 
  # Returns:
  #   dataframe that is a subset of iisLogData with requests within the date range requested
  
  filteredData <- subset(iisLogData, local_datetime >= as.POSIXct(startDateTime, tz=localtz)  & local_datetime <= as.POSIXct(endDateTime, tz=localtz))
  
  return(filteredData)
}