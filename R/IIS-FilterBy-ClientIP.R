IIS.FilterBy.ClientIP <- function(iisLogData, ipAddress) {
  # Filters out any data not from the client ip address.
  # Args:
  #   iisLogData: dataframe with iis log data
  #   ipAddress: ip address as a string or a vector of ip addresses to test with
  # 
  # Returns:
  #   dataframe that is a subset of iisLogData with request from ipAddress
  
  if (is.vector(ipAddress)) {
    filteredData <- subset(iisLogData, c_ip %in% ipAddress)
  } else {
    filteredData <- subset(iisLogData, c_ip == ipAddress)  
  }
  
  return(filteredData)
}