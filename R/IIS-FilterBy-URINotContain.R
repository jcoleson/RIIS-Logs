IIS.FilterBy.URINotContain <- function(iisLogData, urlContainsString) {
  # Filters out any data not from the client ip address.
  # Args:
  #   iisLogData: dataframe with iis log data
  #   urlContainsString: A URI fragment that will be searched using grep 
  # 
  # Returns:
  #   dataframe that is a subset of iisLogData without urlContainsString
  
  filteredData <- iisLogData[!grepl(urlContainsString,iisLogData$cs_uri_stem,ignore.case = TRUE),]
  
  return(filteredData)
}