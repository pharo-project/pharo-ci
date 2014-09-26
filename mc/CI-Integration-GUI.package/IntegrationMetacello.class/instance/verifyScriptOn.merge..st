scripts
verifyScriptOn: integration merge: mergeBoolean
	^ String streamContents: [ :stream | 
		self wrap: stream withPreloadAndPostload: [ 
			stream 
				<< ' [ ' << String cr
				<< ' Gofer it ' << String cr
				<< '	smalltalkhubUser: ''Pharo'' project: ''' << integration inboxProjectName << ''';' << String cr
				<< '	configurationOf: ''' << self configurationName << ''';' << String cr
				<< '	loadVersion: ' << self version printString << '] value. ' << String cr
				<< self postload << String cr ] ]