validation
validateLocally: aCIChange
	| instance |
	
	instance := self new.
	
	[ 
		"here we are in the forked image, let's run it"
		instance 
			change: aCIChange asLocalObject;
			recordEnvironmentChangeDuring: [
			instance recordValidationChangesDuring: [ instance change load ]]
	] on: Error, Exit do: [ :e | 
		instance addError: e ].
	
	instance validationResult change: nil.
	"now than we got results, doit over, over ... "
	^ instance validationResult