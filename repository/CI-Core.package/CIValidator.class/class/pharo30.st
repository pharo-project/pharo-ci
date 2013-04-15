instance creation
pharo30
	| validator |
	validator := self new.
	validator addRule: (CIRunTestsRule selectTestCaseBlock: [ :case| case name = #FooTest ]).
	^ validator