Deprecation raiseWarning: false.
Author fullName: 'hudson'.
spec := (MooseReports createReportFrom: #pharoHealthReport on: MooseReports createModelForPharoKernel). 
"printer := FMMSEPrinter new stream: (StandardFileStream forceNewFileNamed: 'PharoKernel.mse')."
spec archiveResultsAsMse.
"spec accept: printer."
