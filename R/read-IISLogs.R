read.IISLogs <- function(logPath, logFilePattern = "u_ex*.log") {
  # Reads all the file in the given directory and returns a combined dataframe.
  # Args:
  #   logPath: directory path to log files
  #   logFilePattern: file pattern to find log files, example: *.log
  #
  # Returns:
  #   dataframe with the combined log file data
 

  listOfLogFiles = list.files(path=logPath, pattern=logFilePattern)
  

  for (i in 1:length(listOfLogFiles)) {
    currentLogFile <- read.IISLog(listOfLogFiles[i])
    allLogFiles <- rbind.all.columns(currentLogFile, allLogFiles)
  }
  
  return (allLogFiles)
}