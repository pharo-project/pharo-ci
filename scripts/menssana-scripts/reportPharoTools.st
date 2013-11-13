Deprecation raiseWarning: false.
Author fullName: 'hudson'.
spec:= (MooseReports createReportFrom: #pharoHealthReport on: MooseReports createPharoToolsModel).
"printer := FMMSEPrinter new stream: (StandardFileStream forceNewFileNamed: 'PharoTools.mse').
spec accept: printer."
spec archiveResultsAsMse.
