tests
isGreen
	"Here I ensure that no tests are failing"
	| failures errors |
	
	currentTests ifNil: [ ^ self ].
	
	failures := #().
	errors := #().
	
	failures := currentTests failures reject:[: each || detected |
		detected := previousTests failures detect: [:e2 | each name = e2 name ] ifNone: [nil].
		detected ifNil: [ false ] ifNotNil: [ each selector = detected selector ]].
	
	errors := currentTests errors reject:[: each || detected |
		detected := previousTests errors detect: [:e2 | each name = e2 name ] ifNone: [nil].
		detected ifNil: [ false ] ifNotNil: [ each selector = detected selector ]].
	
	^ failures isEmpty and: [ errors isEmpty ]