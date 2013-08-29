validation
recordValidationChangesDuring: aChangeBlock
	"Performs a 2 step validation
		1. pre validation without applying aChangeBlock
		2. post validation after applying aChangeBlock 
	and creates a diff of the validation result to exclude failing results from step 1."
	
	self inform: 'Collect clean results'.
	self preLoadValidate.
	
	self inform: 'Loading change.'.
	[[ loadTime := aChangeBlock timeToRun ]
		on: Error, Deprecation , Warning do: [ :error |
			self inform: 'Could not apply change: ', error asString.
			^ self addError: (String streamContents: [ :stream |
				stream << 'Could not apply change: '; print: error.
				error signalerContext shortDebugStackOn: stream ])]
	] on: Exception do: [ :e |
		self inform: '   loading signalled ', e asString.
		e pass ].
	
	self inform: 'Loaded change in ', loadTime asString, ' ms, aplying validation rule'.
	self postLoadValidate.
	self inform: 'removing false positives'.
	self removeFalsePositives.