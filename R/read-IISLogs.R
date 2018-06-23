read.IISLogs <- function(logsFilePaths, filterFunction=NULL) {
  # Reads all the file in the given directory and returns a combined dataframe.
  # Args:
  #   logsFilePaths: a list of full file paths
  #   filterFunction: function that takes a data frame with an IIS log file loaded 
  #
  # Returns:
  #   dataframe with the combined log file data
  
  allLogFiles <- NULL
  
  for (singleLogFilePath in logsFilePaths) {
    currentLogFile <- read.IISLog(singleLogFilePath)
    if (!is.null(filterFunction)) {
      currentLogFile <- filterFunction(currentLogFile)
    }

    if (is.null(allLogFiles)) { 
      allLogFiles <- currentLogFile
    } else {
      allLogFiles <- IIS.Merge(allLogFiles, currentLogFile)
    }
  }

return (allLogFiles)
}