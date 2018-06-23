Utilities.ApplyGroupByStandards <- function(iisLogDataGrouped, firstColumnName) {
  
  names(iisLogDataGrouped) <- c(firstColumnName,'Freq')
  
  iisLogDataGrouped <- subset(iisLogDataGrouped, Freq > 0)
  iisLogDataGrouped <- iisLogDataGrouped[order(-iisLogDataGrouped$Freq),]
  
  return(iisLogDataGrouped)
}