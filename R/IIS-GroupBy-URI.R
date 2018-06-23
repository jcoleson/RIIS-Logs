IIS.GroupBy.URI <- function(iisLogData) {
  # Group data by URI with a count of that URI's frequency 
  # Args:
  #   iisLogData: dataframe with iis log data
  # 
  # Returns:
  #   dataframe that is a subset of iisLogData without urlContainsVector
  
  iisLogDataGrouped <- as.data.frame(table(iisLogData$cs_uri_stem))
  
  iisLogDataGrouped <- Utilities.ApplyGroupByStandards(iisLogDataGrouped, 'URI')
  
  return(iisLogDataGrouped)
}