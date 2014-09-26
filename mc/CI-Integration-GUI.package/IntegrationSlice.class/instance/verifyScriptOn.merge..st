scripts
verifyScriptOn: integration merge: mergeBoolean
	| slice message |
	
	message := mergeBoolean 
		ifTrue: [ 'merge' ]
		ifFalse: [ 'changes' ].
	
	slice := self version ifNil: [ self fetchLatestVersionNameOn: integration ].
	^ String streamContents: [ :stream | 
		self wrap: stream withPreloadAndPostload: [ 
			stream 
				<< ' [ | repository inspector | ' << String cr
				<< 'repository := MCSmalltalkhubRepository 
	owner: ''Pharo'' 
	project: ''' << integration inboxProjectName << ''' 
	user: '''' 
	password: ''''.' << String cr 
				<< 'inspector := MCFileRepositoryInspector repository: repository workingCopy: nil.' << String cr
				<< 'inspector version: (repository versionFromFileNamed: ''' << slice << '.mcz'').' << String cr
				<< 'inspector ' << message << ' ] value. ' << String cr ] ]