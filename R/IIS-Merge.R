IIS.Merge <- function(iisLogFile1, iisLogFile2) {
  # Filters out any data not from the client ip address.
  # Args:
  #   iisLogFile1: first log file
  #   iisLogFile2: second log file 
  # 
  # Returns:
  #   dataframe that combines iisLogFile1 and iisLogFile2
  
  return (rbind.all.columns(iisLogFile1, iisLogFile2))
}