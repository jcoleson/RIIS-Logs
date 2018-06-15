IIS.FilterBy.URIContainsAny <- function(iisLogData, urlContainsVector) {
  # Filters out any data not from the client ip address.
  # Args:
  #   iisLogData: dataframe with iis log data
  #   urlContainsVector: A URI fragment that will be searched using grep 
  # 
  # Returns:
  #   dataframe that is a subset of iisLogData with request from urlContainsVector
  
  filteredData <- iisLogData[grep(paste(urlContainsVector,collapse="|"),iisLogData$cs_uri_stem,ignore.case = TRUE),]
  
  return(filteredData)
}