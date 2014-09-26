*CI-Integration
fullConfiguration
	^ self hasConfiguration 
		ifTrue: [ 
			String streamContents: [ :stream |
				stream  
					<< self configurationName
					<< ' (' << (self configurationVersion ifEmpty: [ #stable ]) << ')' ] ]
		ifFalse: [ '' ]