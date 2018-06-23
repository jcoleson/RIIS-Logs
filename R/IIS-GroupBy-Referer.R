IIS.GroupBy.Referer <- function(iisLogData) {
  # Group data by referer URI with a count of that URI's frequency 
  # Args:
  #   iisLogData: dataframe with iis log data
  # 
  # Returns:
  #   dataframe with Referer and Freq of the Referer. 
  
  iisLogDataGrouped <- as.data.frame(table(iisLogData$cs_Referer_))
  
  iisLogDataGrouped <- Utilities.ApplyGroupByStandards(iisLogDataGrouped, 'Referer')
  
  return(iisLogDataGrouped)
}