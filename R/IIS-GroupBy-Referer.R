IIS.GroupBy.Referer <- function(iisLogData) {
  # Group data by URI with a count of that URI's frequency 
  # Args:
  #   iisLogData: dataframe with iis log data
  # 
  # Returns:
  #   dataframe that is a subset of iisLogData without urlContainsVector
  
  iisLogDataGrouped = as.data.frame(table(iisLogData$cs_referer_))
  names(iisLogDataGrouped) = c('Referer','Freq')
  
  iisLogDataGrouped = subset(iisLogDataGrouped, Freq > 0)
  
  return(iisLogDataGrouped)
}