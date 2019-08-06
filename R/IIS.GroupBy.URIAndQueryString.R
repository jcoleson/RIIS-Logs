IIS.GroupBy.URIAndQueryString <- function(iisLogData) {
  # Group data by URI with a count of that URI's frequency 
  # Args:
  #   iisLogData: dataframe with iis log data
  # 
  # Returns:
  #   dataframe that is a subset of iisLogData without urlContainsVector
  
  iisLogDataGrouped <- as.data.frame(table(paste(cmsdata$cs_uri_stem,cmsdata$cs_uri_query, sep="?")))
  
  iisLogDataGrouped <- Utilities.ApplyGroupByStandards(iisLogDataGrouped, 'URI')
  
  return(iisLogDataGrouped)
}