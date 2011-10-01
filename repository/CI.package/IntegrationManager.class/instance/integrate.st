entry point
integrate
	"second phase of integration"
	"tests + upload"
	| loaders |

	"Run a first time tests"
	previousTests := self runTests.
	
	"Install sequenticially sources from issues"
	self preLoadScript fileIn.
	loaders := scriptLoader loadPackageFromWaitingFolder.
	self postLoadScript fileIn.

	"Re run tests to validate coexistence of the issues"
	currentTests := self runTests.
	
	"Check tests are all greens"
	self isGreen ifFalse: [ ^ self ].
	self halt.
	"Now I comment and close issues in parallele"
	scriptLoader publishChanges.
	self closeAll.
	self buildSumUp.
	self sendMail.
	
	"tear down just in case"
	issuesToIntegrate := nil.