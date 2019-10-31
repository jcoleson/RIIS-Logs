IIS.FilterBy.Status <- function(iisLogData, status) {
  # Filters out any data not with the given status.
  # Args:
  #   iisLogData: dataframe with iis log data
  #   status: a single status code or a verctor with a list of status codes 
  # 
  # Returns:
  #   dataframe that is a subset of iisLogData with requests that match the given status
  
  
  
  if (is.vector(status)) {
    filteredData <- subset(iisLogData, sc_status %in% status)
  } else {
    filteredData <- subset(iisLogData, sc_status == status)
  }
  
  return(filteredData)
}