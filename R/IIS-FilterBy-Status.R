IIS.FilterBy.Status <- function(iisLogData, status) {
  # Filters out any data not with the given status.
  # Args:
  #   iisLogData: dataframe with iis log data
  #   startDateTime: Earliest date/time to inlcude 
  #   endDateTime: Latest date/time to inlcude 
  # 
  # Returns:
  #   dataframe that is a subset of iisLogData with requests within the date range requested
  
  filteredData <- subset(iisLogData, sc_status == status)
  
  return(filteredData)
}