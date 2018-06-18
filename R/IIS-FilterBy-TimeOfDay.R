IIS.FilterBy.TimeOfDay <- function(iisLogData, startTime, endTime, timeFormat="%I:%M:%S %p") {
  # Group data by URI with a count of that URI's frequency 
  # Args:
  #   iisLogData: dataframe with iis log data
  #   startTime: string containing the earliest time to include
  #   endTime:  string containing the latest time to inlcude 
  #   timeFormat: format that startTime and endTime are in
  # 
  # Returns:
  #   dataframe that is a subset of iisLogData without urlContainsVector
  
  startTimelt <- format(as.POSIXlt(startTime, format=timeFormat), " %H:%M:%S" )
  endTimelt <- format(as.POSIXlt(endTime, format=timeFormat), " %H:%M:%S" )
  filteredData <- iisLogData
  filteredData <- filteredData[which(filteredData$local_datetime >= as.POSIXct(paste0(format(filteredData$local_datetime, format="%Y-%m-%d"), startTimelt))),]
  filteredData <- filteredData[which(filteredData$local_datetime <= as.POSIXct(paste0(format(filteredData$local_datetime, format="%Y-%m-%d"), endTimelt))),]
  
  return(filteredData)
}