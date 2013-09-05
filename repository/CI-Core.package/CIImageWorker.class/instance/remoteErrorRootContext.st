private
remoteErrorRootContext
	"Return the context from which a remote error should be thrown"
	^ (thisContext findContextSuchThat: [ :context |
		 context method = (self class >> #value) ]) sender