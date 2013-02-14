entry point
integrate
	"second phase of integration"
	"tests + upload"
	| loaders |

	"Run a first time tests"
	previousTests := self runAllTests.
	
	"Install sequenticially sources from issues"
	self preLoadScript reset fileIn.
	loaders := scriptLoader loadPackageFromWaitingFolder.
	self postLoadScript reset fileIn.

	"Re run tests to validate coexistence of the issues"
	currentTests := self runAllTests.
	
	"Check tests are all greens"
	self isGreen ifFalse: [ ^ self ].

	"Now I comment and close issues in parallele"
	scriptLoader publishChangesSilently.
	self closeAll.
	self buildSumUp.
	self generateMailScript.
	
	"tear down just in case"
	issuesToIntegrate := nil.
	postloadScript := nil.
	preloadScript := nil.