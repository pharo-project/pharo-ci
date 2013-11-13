Deprecation raiseWarning: false.
Author fullName: 'hudson'.
mseDirectoryPath := '/builds/workspace/ReportPharoTools12/ReportPharoTools12'.
mseDirectory := FileDirectory on: mseDirectoryPath.
msePath := (mseDirectory fileNamesMatching: '*.mse') first.

spec := (MooseReports importReportAndResultsFrom: mseDirectoryPath,'/',msePath).
spec openBrowserForImportedConcerns.