read.IISLogsByFileSearch <- function(directoryPath, logFilePattern = "u_ex*.log", filterFunction=NULL) {
  # Reads all the file in the given directory and returns a combined dataframe.
  # Args:
  #   directoryPath: Directory Path
  #   logFilePattern: latter 
  #
  # Returns:
  #   dataframe with the combined log file data
  
  
  listOfLogFiles <- list.files(path=directoryPath, pattern=logFilePattern)
  
  for (singleLogFilePath in logsFilePaths) {
    currentLogFile <- read.IISLog(singleLogFilePath)
    if (!is.null(filterFunction)) {
      currentLogFile <- filterFunction(currentLogFile)
    }
    allLogFiles <- rbind.all.columns(allLogFiles, currentLogFile)
  }
  
  return (allLogFiles)
}
