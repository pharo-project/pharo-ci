tests
testMetacelloToolBox
	| result |
	result := (Smalltalk at: #MetacelloToolBox) validateConfiguration: self configuration class.
	result do: [ :each |
		self addError: each asString].
	
	^ self validationResult 
	
