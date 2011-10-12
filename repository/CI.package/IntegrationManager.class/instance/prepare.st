entry point
prepare
	"I am used as the first phase of integration stuff"
	"New version + preparation of the packages"
	
	| versionNumber script imageName |
	self issuesToIntegrate isEmptyOrNil ifTrue: [ ^ self ].
	
	scriptLoader := ScriptLoader new.
	versionNumber := scriptLoader prepareNewUpdateSilently.
	versionNumber ifNil: [ ^ self ].
	"Here I kill the working copy of my packages to prevent scriptlaod to add them"
	self removeWorkingCopies.
	" Here I assume I am using the latest version of the image "
	self newVersionNumber: versionNumber.
	
	"Fork the image to run tests in a fresh image where I can test the load of the files"
	"I quit here and I will use the system to duplicate the image"