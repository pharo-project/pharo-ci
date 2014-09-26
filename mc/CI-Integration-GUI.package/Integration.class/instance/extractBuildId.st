private executing
extractBuildId
	buildId := (self workingDirectory files 
		detect: [ :each | each extension = 'cs' ]) base copyUpTo: $-