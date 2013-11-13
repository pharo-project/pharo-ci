Deprecation raiseWarning: false.
Author fullName: 'hudson'.
mseDirectoryPath := '/builds/workspace/ReportPharoSupport12/ReportPharoSupport12'.
mseDirectory := FileDirectory on: mseDirectoryPath.
msePath := (mseDirectory fileNamesMatching: '*.mse') first.

spec := (MooseReports importReportAndResultsFrom: mseDirectoryPath,'/',msePath).
spec openBrowserForImportedConcerns.