tests
testIsLoadable
"	self change assertLoadable.
	ImageWorker evaluate: [| test specLoader|
	(self change group isNil )
		ifTrue: [ test := self change configurationPoint load ]
		ifFalse: [ test := self change configurationPoint load: self group].
	test isNil 
		ifTrue: [ ^ self addError: self change asString, ': Problem while loading' ].
	specLoader := test spec.
	specLoader required isEmpty 
		ifTrue: [ self addError: self change asString, ': loading required is empty' ].
	specLoader packages isEmpty not
		ifTrue: [ self addMessage: self change asString, ': load this packages, ', specLoader packages asString ].
	specLoader loaderPolicy isNotNil 
		ifTrue: [ self addMessage: self change asString, specLoader loaderPolicy loadDirective asString  ]
		ifFalse: [ self addError: self change asString, ': loading''s directive is anormal '  ].]"
		
	 
	