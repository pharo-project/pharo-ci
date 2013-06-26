*CI-Core-Validation
result
	| environment |
	rules ifEmpty: [ 
		^ RBBrowserEnvironment empty ].
	
	environment := rules first result.
	rules allButFirstDo: [ :rule|
		environment := environment | rule result ].
	^ environment
