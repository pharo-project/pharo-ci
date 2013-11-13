Deprecation raiseWarning: false.
Author fullName: 'hudson'.
mseDirectoryPath := '/builds/workspace/ReportPharoGraphics12/ReportPharoGraphics12'.
mseDirectory := FileDirectory on: mseDirectoryPath.
msePath := (mseDirectory fileNamesMatching: '*.mse') first.

spec := (MooseReports importReportAndResultsFrom: mseDirectoryPath,'/',msePath).
spec openBrowserForImportedConcerns.