*CI-Integration
publishChangesSilently
	| username password changescriptname changesetFilename str strings|
	(FileStream isAFileNamed: 'PharoPass.txt') 
		ifTrue: [ str := FileStream fileNamed:  'PharoPass.txt'. 
				strings := str contents substrings.
				username := strings first.
				password := strings second] 
		ifFalse: [ username := UIManager default request: 'Pharo repository login'.
			     password := UIManager default requestPassword: 'Pharo repository password'.].

	self setToRepositoriesPassword: password to: username.
	
	
	changescriptname := (IntegrationManager default issuesToIntegrate collect: #id) joinUsing: '-'.	
	changesetFilename := self CSForLastUpdateAndPatchUpdatesList: changescriptname.
	self copyPackagesFromWaitingFolderToHomeRepository.