validation
validateLocally: aCIChange
	| instance |
	1halt.
	"here we are in the forked image, let's run it"
	instance := self change: aCIChange asLocalObject.
	
	[ instance recordEnvironmentChangeDuring: [
			instance recordValidationChangesDuring: [ instance change load] ]
	] on: Error, Exit do: [ :e | 
		instance addError: e ].
	1halt. 
	"now than we got results, doit over, over ... "
	^ instance validationResult