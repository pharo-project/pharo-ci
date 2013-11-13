Deprecation raiseWarning: false.
Author fullName: 'hudson'.
spec := (MooseReports createReportFrom: #pharoHealthReport on: MooseReports createPharoGraphicsModel). 
"printer := FMMSEPrinter new stream: (StandardFileStream forceNewFileNamed: 'PharoKernel.mse')."
spec archiveResultsAsMse.
"spec accept: printer."
