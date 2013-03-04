*CI-FogBugzAPI
migrateToIssue:  newId with: tracker
	| command newContent arguments |
	
	command := 'edit'.
	newContent := ''.
	
	self author 
		ifNil: [ newContent := String streamContents: [:s | s << 'Comment ' << self id << ':' << String cr << self content ]]
		ifNotNil: [:a | 
			(self content beginsWith: a email)
				ifFalse: [ newContent := String 
											streamContents: [:s | s << self title <<  ': ' << String cr << self content ]]].
		
	arguments := Dictionary new
					at: 'sEvent' put: newContent;
					at: 'ixBug' put: newId asString;
					yourself.
	
	(self status isNil or: [ self id isZero ]) ifFalse: [ | pair |
		pair := self convertStatus: self status arguments: arguments.
		command := pair key.
		arguments at: 'sStatus' put: pair value ].
	
	self labels ifNotNil: [:col | tracker analyzeLabels: col andFill: arguments ].

	self attachments doWithIndex:[ :each :index || oldFile |
		oldFile := FileSystem workingDirectory resolve: each filename.
		oldFile ensureDeleted.
		ZnClient new
			url: each url;
			downloadTo: each filename.
		arguments at: 'File', index asString put: each filename ].
	
	arguments at: 'nFileCount' put: self attachments size asString.
	arguments at: 'cmd' put: command.
	
	(command = 'close') ifTrue: [ 
		arguments at: 'cmd' put: 'resolve'.
		tracker sendRequestWithArguments: arguments.
		arguments 
			at: 'cmd' put: 'close';
			at: 'sEvent' put: '' ].

	tracker sendRequestWithArguments: arguments.