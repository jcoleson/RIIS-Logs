IIS.FilterBy.ClientIP <- function(iisLogData, ipAddress) {
  # Filters out any data not from the client ip address.
  # Args:
  #   iisLogData: dataframe with iis log data
  #   ipAddress: Name of your local time zone if you want to convert time to local
  # 
  # Returns:
  #   dataframe that is a subset of iisLogData with request from ipAddress
  
  filteredData <- subset(iisLogData, c_ip == ipAddress)
  
  return(filteredData)
}