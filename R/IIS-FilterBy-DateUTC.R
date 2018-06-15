IIS.FilterBy.DateUTC <- function(iisLogData, startDateTime, endDateTime) {
  # Filters out any data not from the client ip address.
  # Args:
  #   iisLogData: dataframe with iis log data
  #   startDateTime: Earliest date/time to inlcude 
  #   endDateTime: Latest date/time to inlcude 
  # 
  # Returns:
  #   dataframe that is a subset of iisLogData with requests within the date range requested
  
  return (IIS.FilterBy.Date(iisLogData, startDateTime, endDateTime, localtz="UTC"))
}