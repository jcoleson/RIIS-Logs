IIS.FilterBy.URINotContainAny <- function(iisLogData, urlContainsVector) {
  # Filters out any data not from the client ip address.
  # Args:
  #   iisLogData: dataframe with iis log data
  #   urlContainsVector: A URI fragment that will be searched using grep 
  # 
  # Returns:
  #   dataframe that is a subset of iisLogData without urlContainsVector
  
  filteredData <- iisLogData[!grepl(paste(urlContainsVector,collapse="|"),iisLogData$cs_uri_stem,ignore.case = TRUE),]
  
  return(filteredData)
}