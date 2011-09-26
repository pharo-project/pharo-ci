entry point
integrate
	"I am used to integrate issues into Pharo"
	| loaders |
	
	" Later add here OSProcess part to
		- copy scripts
		- retrieve last Version "

	" Here I assume I am using the latest version of the image "
	self newVersionNumber: SystemVersion current highestUpdate +1.
	
	issuesToIntegrate := self openSelectionList.
	issuesToIntegrate ifNil: [ ^ self ].
	
	"Download sources from the internet in parallele"
	self loadSources.
	
	"Run a first time tests"
	previousTests := self runTests.
	
	"Install sequenticially sources from issues"
	loaders := self installSources.
	
	"Re run tests to validate coexistence of the issues"
	currentTests := self runTests.
	
	"Check tests are all greens"
	self ensureStability.
	
	"Now I comment and close issues in parallele"
	self closeIssues.
	self halt.