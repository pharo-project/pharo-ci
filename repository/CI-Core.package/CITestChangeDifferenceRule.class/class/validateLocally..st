validation
validateLocally: aValidationRule
	| instance |
	
	instance := aValidationRule asLocalObject.
	
	[ 
		"here we are in the forked image, let's run it"
		instance recordEnvironmentChangeDuring: [
			instance recordValidationChangesDuring: [ instance change load ]]
	] on: Error, Deprecation , Exit do: [ :e | 
		instance addError: e ].
	
	instance validationResult change: nil.
	"now than we got results, doit over, over ... "
	^ instance validationResult